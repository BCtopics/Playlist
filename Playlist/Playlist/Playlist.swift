//
//  Playlist.swift
//  Playlist
//
//  Created by Tetiana Babycheva on 5/24/17.
//  Copyright © 2017 babycheva. All rights reserved.
//

import Foundation

class Playlist {
    
    private let nameKey = "name"
    private let songsKey = "songs"
    
    let name: String
    var songs: [Song]
    
    init(name: String, songs: [Song] = []) {
        self.name = name
        self.songs = songs
    }
    
    
    // Pulling a playlist from UserDefaults and creating a new instance
    
    init?(dictionary: [String: Any]) {
        
        if let name = dictionary[nameKey] as? String,
        let songsDictionariesArray = dictionary[songsKey] as? [[String: String]] {
            
            self.name = name

            
            // Take each songDictionary and initializa a Song Object from it, then append it to the array of songs
            var songs: [Song] = [] // make a placeholder
          
            for songDictionary in songsDictionariesArray {
              
                if let song = Song(dictionary: songDictionary) {  //passing a song through a Song initializer
                    
                    songs.append(song)
                }
            }
            
            self.songs = songs
        
        } else {
            return nil
        }
        
    }

    
    // taking our code and turning it into format that swift can read (from an object to dict)
    // dictionaryRepresebtation is  FOR SAVING TO USERDEFAULTS
    
    var dictionaryRepresentation: [String: Any] {
        
        // songDictionaries is taking each song in the playlist's array of songs, and taking each one's dictionaryRepresentation
        
        //type of this var - an array of dictionaries
        var songsDictionaries: [[String: String]] = []
       
        
        // looping thourgh each song in the old array of song and adding each song's dictionary to a new array
        
        for song in songs {
            
            let songDictionary = song.dictionaryRepresentation
            
            songsDictionaries.append(songDictionary)
            
        }
        
       // take each value on the playlist and put them in the dictionary to be saved to UserDefaults
      let playlistDictionary: [String: Any] = [nameKey: name, songsKey: songsDictionaries]
        
      return playlistDictionary
        
    }
}


















