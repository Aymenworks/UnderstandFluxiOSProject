//
//  MasterViewController.swift
//  UnderstandFluxProject
//
//  Created by Rebouh Aymen on 28/01/2019.
//  Copyright © 2019 Rebouh Aymen. All rights reserved.
//

import UIKit

class ArtistsTableViewController: UITableViewController {

    var objects = [Any]()

    var persistenceStore: PersistenceStore!

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.leftBarButtonItem = editButtonItem

        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(insertNewObject(_:)))
        navigationItem.rightBarButtonItem = addButton
    }

    override func viewWillAppear(_ animated: Bool) {
        clearsSelectionOnViewWillAppear = splitViewController!.isCollapsed
        super.viewWillAppear(animated)
    }

    @objc
    func insertNewObject(_ sender: Any) {
        let artistCreationAlertController = UIAlertController(title: "Add artist", message: nil, preferredStyle: .alert)
        artistCreationAlertController.addTextField { textFieldToAdd in
            textFieldToAdd.placeholder = "Artist name"
        }
        
        artistCreationAlertController.addAction(UIAlertAction(title: "Create", style: .default) { [weak self] _ in
            guard let artistName = artistCreationAlertController.textFields?.first?.text else { return }
            let artist = Artist(name: artistName)
            self?.persistenceStore.artists.value.append(artist)
        })
        
        artistCreationAlertController.addAction(UIAlertAction(title: "Cancel", style: .cancel) { _ in })
        
        present(artistCreationAlertController, animated: true, completion: nil)
    }

    // MARK: - Segues

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let artist = persistenceStore.artists.value[indexPath.row]
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
        return persistenceStore.artists.value.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ArtistCell", for: indexPath)

        let artist = persistenceStore.artists.value[indexPath.row]
        cell.textLabel?.text = artist.name
        cell.detailTextLabel?.text = "Musics: \(artist.musicsCreated.count)"
        
        return cell
    }

    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            objects.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
        }
    }


}

