//
//  MusicsListTableViewController.swift
//  UnderstandFluxProject
//
//  Created by Rebouh Aymen on 28/01/2019.
//  Copyright © 2019 Rebouh Aymen. All rights reserved.
//

import Foundation
import UIKit
import RxSwift

class MusicsTableViewController: UITableViewController {
    
    // MARK: Properties
    
    var persistenceStore: PersistenceStore!
    let disposeBag = DisposeBag()
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.leftBarButtonItem = editButtonItem

        persistenceStore.exempleModel
            .asObservable()
            .skip(1)
            .subscribe(onNext: { [weak self] _ in
                self?.tableView.reloadData()
            })
            .disposed(by: disposeBag)
    }
    
    // MARK: - Table View
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return persistenceStore.exempleModel.value.musics.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MusicCell", for: indexPath)
        
        let music = persistenceStore.exempleModel.value.musics[indexPath.row]
        cell.textLabel?.text = music.name
        cell.detailTextLabel?.text = "Creator: \(music.createdBy.name)"
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let music = persistenceStore.exempleModel.value.musics[indexPath.row]
            persistenceStore.exempleModel.value.delete(music: music)
        }
    }
}

