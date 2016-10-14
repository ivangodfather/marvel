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

    fileprivate let cellId = String(describing: ListCharacterTableViewCell.self)
    var characters: [MarvelCharacter] = [] { didSet { tableView.reloadData() } }
    var presenter: ListCharactersPresenter!

    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        presenter.viewDidLoad()
    }

    override func updateGUI() {
        super.updateGUI()
        self.title = "List"
    }

    private func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        let nib = UINib(nibName: cellId, bundle: Bundle.main)
        tableView.register(nib, forCellReuseIdentifier: cellId)
    }

}

extension ListCharactersViewController: ListCharactersUI {
    func showCharacters(characters: [MarvelCharacter]) {
        self.characters = characters
    }
}

extension ListCharactersViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characters.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellId) as? ListCharacterTableViewCell else { fatalError() }
        let character = characters[indexPath.row]
        cell.configureWithCharacter(character: character)
        return cell
    }
}

extension ListCharactersViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let character = characters[indexPath.row]
        presenter.didTap(character: character)
    }
}
