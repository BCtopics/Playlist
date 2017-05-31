//
//  PlaylistController.swift
//  Playlist

//  Created by Bradley GIlmore on 5/31/17.
//  Copyright © 2017 Bradley Gilmore. All rights reserved.
//

import Foundation

class PlaylistController {
    
    static let shared = PlaylistController()   // Instance of a Playlist Controller
    
    private let playlistsKey = "playlists"  // Create a constant to prevent human error of mistyping create constants
    
    var playlists: [Playlist] = []
    //these playlists are one source of truth used throughout our app
    
    
    init() {
        loadFromPersistentStore()
    }
    
    // CRUD
    
    func createPlaylist(withName name: String) {
        
        let playlist = Playlist(name: name)
        
        self.playlists.append(playlist)
        
        saveToPersistentStore()
    }
    
    func deletePlaylist(playlist: Playlist) {
 
    // Delete the instance of the playlist from playlist array (self.playlists)
    }
    
    func add(song: Song, toPlaylist playlist: Playlist) {
        
        playlist.songs.append(song)
        
        saveToPersistentStore()
        
    }
    
    func saveToPersistentStore() {
        
        //Turn the array of Playlist objects into an array of dictionaryRepresentations that can be stored into UserDefaults
        
        var playlistDictionaries: [[String: Any]] = []
        
        for playlist in playlists {
            
            let dictionary = playlist.dictionaryRepresentation
            
            playlistDictionaries.append(dictionary)
            
            // same method using mapping:
            //let playlistDictionaries2 = playlists.map({$0.dictionaryRepresentation})

        }
        
         // Save our playlists to UserDefaults
        UserDefaults.standard.set(playlistDictionaries, forKey: playlistsKey)
    }
    
    
    func loadFromPersistentStore() {
        
        // calling an array of dictionaries from UserDefaults
        
        if let playlistDictionaries = UserDefaults.standard.object(forKey: playlistsKey) as? [[String: Any]] {
            
            var playlists: [Playlist] = []
            
            for playlistDictionary in playlistDictionaries {
                
                if  let playlist = Playlist(dictionary: playlistDictionary) { //unwrap an optional playlist
                    
                    playlists.append(playlist)
                    
                }
            }
           
            self.playlists = playlists
        }
    }
}










