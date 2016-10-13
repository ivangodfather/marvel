//
//  ListCharactersViewController.swift
//  Marvel
//
//  Created by Ivan Ruiz Monjo on 13/10/16.
//  Copyright © 2016 Ivan Ruiz Monjo. All rights reserved.
//

import UIKit
import RxSwift

class ListCharactersViewController: UIViewController {

    fileprivate let cellId = String(describing: ListCharacterTableViewCell.self)

    var characters: [Character] = [] {
        didSet { tableView.reloadData() }
    }

    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        CharactersAPI().get().subscribe(onNext: { characters in
            self.characters = characters
        })

    }

    private func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        let nib = UINib(nibName: cellId, bundle: Bundle.main)
        tableView.register(nib, forCellReuseIdentifier: cellId)
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

}
