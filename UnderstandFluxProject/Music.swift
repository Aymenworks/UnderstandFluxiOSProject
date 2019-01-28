//
//  Music.swift
//  UnderstandFluxProject
//
//  Created by Rebouh Aymen on 28/01/2019.
//  Copyright © 2019 Rebouh Aymen. All rights reserved.
//

import Foundation

struct Music {
    let id = NSUUID.init().uuidString
    let name: String
    let createdBy: Artist
}
