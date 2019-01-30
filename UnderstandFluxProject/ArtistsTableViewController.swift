//
//  MasterViewController.swift
//  UnderstandFluxProject
//
//  Created by Rebouh Aymen on 28/01/2019.
//  Copyright © 2019 Rebouh Aymen. All rights reserved.
//

import UIKit
import RxSwift

class ArtistsTableViewController: UITableViewController {

    // MARK: Properties
    
    let disposeBag = DisposeBag()
    var persistenceStore: PersistenceStore!

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.leftBarButtonItem = editButtonItem

        persistenceStore.exempleModel
            .asObservable()
            .skip(1)
            .subscribe(onNext: { [weak self] model in
                self?.tableView.reloadData()
            })
            .disposed(by: disposeBag)
    }

    override func viewWillAppear(_ animated: Bool) {
        clearsSelectionOnViewWillAppear = splitViewController!.isCollapsed
        super.viewWillAppear(animated)
    }
    
    // MARK: - Segues

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let artist = persistenceStore.exempleModel.value.artists[indexPath.row]
                let controller = segue.destination as! ArtistDetailViewController
                controller.artist = artist
                controller.persistenceStore = self.persistenceStore
                controller.navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem
                controller.navigationItem.leftItemsSupplementBackButton = true
            }
        }
    }

    // MARK: - Table View

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return persistenceStore.exempleModel.value.artists.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ArtistCell", for: indexPath)

        let artist = persistenceStore.exempleModel.value.artists[indexPath.row]
        cell.textLabel?.text = artist.name
        cell.detailTextLabel?.text = "Musics: \(artist.musicsCreated.count)"
        
        return cell
    }

    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let artist = persistenceStore.exempleModel.value.artists[indexPath.row]
            persistenceStore.exempleModel.value.delete(artist: artist)
        }
    }
}

