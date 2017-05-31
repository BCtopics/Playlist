//
//  PlaylistTableViewController.swift
//  Playlist
//
//  Created by Tetiana Babycheva on 5/24/17.
//  Copyright © 2017 babycheva. All rights reserved.
//

import UIKit

class PlaylistTableViewController: UITableViewController {

    
    @IBOutlet weak var playlistNameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
   
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.tableView.reloadData()
    }
    
    @IBAction func addPlaylistButtonTapped(_ sender: Any) {
       
        if let name = playlistNameTextField.text {
            
            PlaylistController.shared.createPlaylist(withName: name)
            self.playlistNameTextField.text = ""
            self.tableView.reloadData()
            
        }
        
    }
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return PlaylistController.shared.playlists.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlaylistCell", for: indexPath)
        
        let playlist = PlaylistController.shared.playlists[indexPath.row]
        
        cell.textLabel?.text = playlist.name
        cell.detailTextLabel?.text = "\(playlist.songs.count)"
        
    
        return cell
    }
   


    // MARK: - Navigation

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toSongsVC" {
            
            if let indexPath = self.tableView.indexPathForSelectedRow {
            
            let destinationVC = segue.destination as? SongsTableViewController
            
            let playlist = PlaylistController.shared.playlists[indexPath.row]
            
            destinationVC?.playlist = playlist
            }
        }
    }
}














