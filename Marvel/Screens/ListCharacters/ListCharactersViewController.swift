//
//  ListCharactersViewController.swift
//  Marvel
//
//  Created by Ivan Ruiz Monjo on 13/10/16.
//  Copyright © 2016 Ivan Ruiz Monjo. All rights reserved.
//

import UIKit
import RxSwift

class ListCharactersViewController: BaseViewController {

    var presenter: ListCharactersPresenter!

    @IBOutlet weak var tableView: UITableView!
    var dataSource: ListCharactersDataSource!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        presenter.viewDidLoad()
    }

    override func updateGUI() {
        super.updateGUI()
        self.title = "List"
        tableView.accessibilityLabel = String(describing: ListCharactersViewController.self)
    }

    private func setupTableView() {
        tableView.dataSource = dataSource
        tableView.delegate = self
        let nib = UINib(nibName: ListCharacterTableViewCell.cellId, bundle: Bundle.main)
        tableView.register(nib, forCellReuseIdentifier: ListCharacterTableViewCell.cellId)
    }

}

extension ListCharactersViewController: ListCharactersUI {
    func showCharacters(characters: [MarvelCharacter]) {
        self.dataSource.characters = characters
        self.tableView.reloadData()
    }
}

extension ListCharactersViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let character = dataSource.characters[indexPath.row]
        presenter.didTap(character: character)
    }
}
