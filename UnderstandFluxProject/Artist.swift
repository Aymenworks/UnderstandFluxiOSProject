//
//  Artist.swift
//  UnderstandFluxProject
//
//  Created by Rebouh Aymen on 28/01/2019.
//  Copyright © 2019 Rebouh Aymen. All rights reserved.
//

import Foundation

struct Artist {
    let id: String
    let name: String
    var musicsCreated: [Music] = []
    
    init(name: String) {
        self.id = NSUUID.init().uuidString
        self.name = name
    }
    
    mutating func add(music: Music) {
        musicsCreated.append(music)
    }
}
