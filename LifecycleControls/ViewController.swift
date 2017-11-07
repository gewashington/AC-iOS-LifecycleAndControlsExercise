//
//  ViewController.swift
//  LifecycleControls
//
//  Created by C4Q  on 11/7/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        songs = Song.loveSongs
        
    }

    var songs = [Song]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songs.count
    }
    //make a segue that will set the stepper number value equal the number of rows count

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let song = songs[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "Song Cell", for: indexPath)
        
        switch Settings.letterStyle {
        case "lower":
            cell.textLabel?.text = song.name.lowercased()
            cell.detailTextLabel?.text = song.artist.lowercased()
            return cell
        case "UPPER":
            cell.textLabel?.text = song.name.uppercased()
            cell.detailTextLabel?.text = song.artist.uppercased()
            return cell
        case "Proper":
            cell.textLabel?.text = song.name.capitalized
            cell.detailTextLabel?.text = song.artist.capitalized
            return cell
        default:
           return cell
        }
//        cell.textLabel?.text = song.name
//        cell.detailTextLabel?.text = song.artist
//        return cell
    }
    
    
    
    
}

