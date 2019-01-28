//
//  AppTabBarViewController.swift
//  UnderstandFluxProject
//
//  Created by Rebouh Aymen on 28/01/2019.
//  Copyright © 2019 Rebouh Aymen. All rights reserved.
//

import Foundation
import UIKit

class AppTabBarViewController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let persistenceStore = PersistenceStore()
        
        // FOR TESTING PURPOOSE: set shared persistenceStore to artists list and musics list controllers
        (((viewControllers?.first as? UISplitViewController)?.viewControllers.first as? UINavigationController)?.topViewController as? ArtistsTableViewController)?.persistenceStore = persistenceStore
        (viewControllers?.last as? MusicsTableViewController)?.persistenceStore = persistenceStore
    }
}
