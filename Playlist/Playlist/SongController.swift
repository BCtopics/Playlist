//
//  SongController.swift
//  Playlist
//
//  Created by Tetiana Babycheva on 5/24/17.
//  Copyright © 2017 babycheva. All rights reserved.
//

import Foundation

class SongController {
    
    static func createSong(withName name: String, artist: String, playlist: Playlist) {
        let song = Song(title: name, artistName: artist)
        PlaylistController.shared.add(song: song, toPlaylist: playlist)

    }
    
}
