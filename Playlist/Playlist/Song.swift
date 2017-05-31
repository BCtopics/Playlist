//
//  Song.swift
//  Playlist
//
//  Created by Tetiana Babycheva on 5/24/17.
//  Copyright © 2017 babycheva. All rights reserved.
//

import Foundation

class Song {
    
    private let titleKey = "title"                      // kTitle is the same as titleKey
    private let artistNameKey = "artistName"
    
    
    
    let title: String
    let artistName: String
    
    init (title: String, artistName: String) {
       
        self.title = title
        self.artistName = artistName
    }
    
    // Failable initializer turns a dictionary into an object
    
    init?(dictionary: [String: String]) {
        
        if let title = dictionary[titleKey],
            let artistName = dictionary[artistNameKey] {
            
            self.title = title
            self.artistName = artistName
        } else {
            return nil
        }
        
    }
    
    var dictionaryRepresentation: [String: String] {    //turns an array into a dict
        
        let dictionary: [String: String] = [titleKey: title, artistNameKey: artistName]
        // same as ["titleKey" : title]
        
        return dictionary
    }
    
}

