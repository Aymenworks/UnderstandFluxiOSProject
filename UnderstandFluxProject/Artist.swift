//
//  Artist.swift
//  UnderstandFluxProject
//
//  Created by Rebouh Aymen on 28/01/2019.
//  Copyright © 2019 Rebouh Aymen. All rights reserved.
//

import Foundation

struct Artist {
    let id: String = NSUUID.init().uuidString
    let name: String
    var musicsCreated: [Music] = []
    
    init(name: String) {
        self.name = name
    }
    
    mutating func add(music: Music) {
        musicsCreated.append(music)
    }
}
