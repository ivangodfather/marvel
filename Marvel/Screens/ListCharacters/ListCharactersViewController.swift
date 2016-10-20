//
//  ListCharactersViewController.swift
//  Marvel
//
//  Created by Ivan Ruiz Monjo on 13/10/16.
//  Copyright © 2016 Ivan Ruiz Monjo. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ListCharactersViewController: BaseViewController {
    
    var presenter: ListCharactersPresenter!
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    var characters = Variable([MarvelCharacter]())
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupSearchBar()
        presenter.viewDidLoad()
    }
    
    override func updateGUI() {
        super.updateGUI()
        self.title = "List"
        tableView.accessibilityLabel = String(describing: ListCharactersViewController.self)
    }
    
    private func setupTableView() {
        let nib = UINib(nibName: ListCharacterTableViewCell.cellId, bundle: Bundle.main)
        tableView.register(nib, forCellReuseIdentifier: ListCharacterTableViewCell.cellId)
        tableView.infiniteScrollIndicatorStyle = .gray
        tableView.addInfiniteScroll { tableView -> Void in
            if self.searchBar.text?.characters.count == 0 {
                self.presenter.tableViewDidScrollToBottom()
            }
        }
        tableView.estimatedRowHeight = 140
        tableView.rowHeight = UITableViewAutomaticDimension
        
        characters.asObservable()
            .bindTo(tableView
                .rx
                .items(cellIdentifier: ListCharacterTableViewCell.cellId,
                       cellType: ListCharacterTableViewCell.self)) { (row, character, cell) in
                        cell.configure(character: character)
            }.addDisposableTo(disposeBag)
        
        
        tableView
            .rx
            .modelSelected(MarvelCharacter.self)
            .subscribe(onNext: {
                character in
                self.presenter.didTap(character: character)
                
            }).addDisposableTo(disposeBag)
        
    }
    
    private func setupSearchBar() {
        searchBar.rx.text
            .skip(1)
            .throttle(0.5, scheduler: MainScheduler.instance)
            .distinctUntilChanged()
            .do(onNext: presenter.searchBarTextDidChange)
            .flatMapLatest({ (text) -> Observable<[MarvelCharacter]> in
                self.waitingHud(show: true)
                return GetCharacters().filtered(name: text, offset: 0)
            }).subscribe(onNext: { (characters) in
                self.waitingHud(show: false)
                self.showCharacters(characters: characters)
            }).addDisposableTo(disposeBag)
        searchBar.placeholder = "Search character"
    }
}

extension ListCharactersViewController: ListCharactersUI {
    func appendCharacters(characters: [MarvelCharacter]) {
        var indexPaths = [IndexPath]()
        var index = self.characters.value.count
        characters.forEach {
            let indexPath = IndexPath(row: index, section: 0)
            indexPaths.append(indexPath)
            index += 1
            self.characters.value.append($0)
        }
        tableView.beginUpdates()
        tableView.insertRows(at: indexPaths, with: .automatic)
        tableView.endUpdates()
        tableView.finishInfiniteScroll()
    }
    
    func showCharacters(characters: [MarvelCharacter]) {
        self.characters.value = characters
        self.tableView.reloadData()
    }
}

extension ListCharactersViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = true
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.showsCancelButton = false
        searchBar.resignFirstResponder()
    }
}
