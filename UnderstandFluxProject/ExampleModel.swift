//
//  ExampleModel.swift
//  UnderstandFluxProject
//
//  Created by Rebouh Aymen on 29/01/2019.
//  Copyright © 2019 Rebouh Aymen. All rights reserved.
//

import Foundation

struct ExempleModel {
    
    // MARK: Properties
    
    var artists: [Artist] = []
    var musics: [Music] = []
    
    // MARK: Lifecycle

    init() {
        // Initial hardcode setup for Test purpose
        
        self.artists = [
            Artist(name: "Tavito Nanao"),
            Artist(name: "Basi"),
            Artist(name: "Ai Otsuka"),
            Artist(name: "Small Circle Of Friends")
        ]
        
        self.musics = [
            Music(name: "Life is bicycle", createdBy: self.artists[3]),
            Music(name: "Daisuki dayo", createdBy: self.artists[2]),
            Music(name: "Sakuranbo", createdBy: self.artists[2]),
            Music(name: "Anataniha", createdBy: self.artists[1]),
            Music(name: "Circus Night", createdBy: self.artists[0]),
            Music(name: "Friends", createdBy: self.artists[2]),
        ]
        
        self.artists[1].musicsCreated = [musics[3]]
        self.artists[2].musicsCreated = [musics[1], musics[2], musics[5]]
        self.artists[3].musicsCreated = [musics[0]]
        self.artists[0].musicsCreated = [musics[4]]
    }
    
    mutating func delete(artist: Artist) {
        self.musics = self.musics.filter { $0.createdBy.id != artist.id }
        self.artists = self.artists.filter { $0.id != artist.id }
    }
    
    mutating func delete(music: Music) {
        self.musics = self.musics.filter { $0.id != music.id }
        
        for i in 0..<artists.count {
            artists[i].musicsCreated = artists[i].musicsCreated.filter { $0.id != music.id }
        }
    }

}
