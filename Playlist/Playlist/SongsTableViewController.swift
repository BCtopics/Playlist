//
//  SongsTableViewController.swift
//  Playlist
//
//  Created by Tetiana Babycheva on 5/24/17.
//  Copyright © 2017 babycheva. All rights reserved.
//

import UIKit

class SongsTableViewController: UITableViewController {
    
    var playlist: Playlist?

    
    @IBOutlet weak var songNameTextField: UITextField!
    
    @IBOutlet weak var artistNameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func addSongButtonTapped(_ sender: Any) {
        
        guard let name = songNameTextField.text,
            let artist = artistNameTextField.text,
            let playlist = self.playlist else {return}
    

        SongController.createSong(withName: name, artist: artist, playlist: playlist)
        songNameTextField.text = ""
        artistNameTextField.text = ""
        self.tableView.reloadData()
    }
    

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return playlist?.songs.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SongCell", for: indexPath)

        guard let song = playlist?.songs[indexPath.row] else {return cell}
        
        cell.textLabel?.text = song.title
        cell.detailTextLabel?.text = song.artistName
    

        return cell
    }
   
}
