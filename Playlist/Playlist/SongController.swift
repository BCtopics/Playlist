//
//  SongController.swift
//  Playlist
//
//  Created by Bradley GIlmore on 5/31/17.
//  Copyright © 2017 Bradley Gilmore. All rights reserved.
//

import Foundation

class SongController {
    
    static func createSong(withName name: String, artist: String, playlist: Playlist) {
        let song = Song(title: name, artistName: artist)
        PlaylistController.shared.add(song: song, toPlaylist: playlist)

    }
    
}
