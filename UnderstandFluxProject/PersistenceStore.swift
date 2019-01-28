//
//  ArtistsListViewModel.swift
//  UnderstandFluxProject
//
//  Created by Rebouh Aymen on 28/01/2019.
//  Copyright © 2019 Rebouh Aymen. All rights reserved.
//

import Foundation
import RxSwift

class PersistenceStore {
    var artists: Variable<[Artist]> = Variable<[Artist]>([])
    
    var musics: Variable<[Music]> = Variable([])
    
    init() {
        self.artists.value = [
            Artist(name: "Tavito Nanao"),
            Artist(name: "Basi"),
            Artist(name: "Ai Otsuka"),
            Artist(name: "Flumpool"),
            Artist(name: "Small Circle Of Friends")
        ]
        
        self.musics.value = [
            Music(name: "Life is bicycle", createdBy: self.artists.value[4]),
            Music(name: "Daisuki dayo", createdBy: self.artists.value[2]),
            Music(name: "Sakuranbo", createdBy: self.artists.value[2]),
            Music(name: "Anataniha", createdBy: self.artists.value[1])
        ]
    }
}
