//
//  ArtistDetailViewController.swift
//  UnderstandFluxProject
//
//  Created by Rebouh Aymen on 28/01/2019.
//  Copyright © 2019 Rebouh Aymen. All rights reserved.
//

import UIKit

class ArtistDetailViewController: UIViewController {

    @IBOutlet weak var detailDescriptionLabel: UILabel!
    var persistenceStore: PersistenceStore!

    func configureView() {
        // Update the user interface for the detail item.
        if let artist = artist {
            detailDescriptionLabel.text = artist.name
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        configureView()
    }

    var artist: Artist? {
        didSet {
            // Update the view.
            configureView()
        }
    }
}

