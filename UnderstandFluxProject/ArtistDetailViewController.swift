//
//  ArtistDetailViewController.swift
//  UnderstandFluxProject
//
//  Created by Rebouh Aymen on 28/01/2019.
//  Copyright © 2019 Rebouh Aymen. All rights reserved.
//

import UIKit
import RxSwift

class ArtistDetailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    // MARK: Properties
    
    @IBOutlet weak var musicsListTableView: UITableView!
    @IBOutlet weak var detailDescriptionLabel: UILabel!
    
    var persistenceStore: PersistenceStore!
    var artist: Artist?
    let disposeBag = DisposeBag()

    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.leftBarButtonItem = editButtonItem
        detailDescriptionLabel.text = artist?.name
        
        if persistenceStore != nil {
            persistenceStore.exempleModel
                .asObservable()
                .skip(1)
                .subscribe(onNext: { [weak self] model in
                    self?.artist = model.artists.filter { $0.id == self?.artist?.id }.first
                    self?.musicsListTableView.reloadData()
                })
                .disposed(by: disposeBag)
        }
    }
    
    // MARK: - Table View
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return artist?.musicsCreated.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MusicCell", for: indexPath)
        guard let music = artist?.musicsCreated[indexPath.row] else { return cell }
      
        cell.textLabel?.text = music.name
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            guard let music = artist?.musicsCreated[indexPath.row] else { return }
            persistenceStore.exempleModel.value.delete(music: music)
        }
    }
}

