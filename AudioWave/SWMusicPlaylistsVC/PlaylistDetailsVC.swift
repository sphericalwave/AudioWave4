//
//  PlaylistDetailsVC.swift
//  AudioWave2
//
//  Created by Aaron Anthony on 2017-06-10.
//  Copyright © 2017 SphericalWave. All rights reserved.
//

import UIKit
import MediaPlayer

class PlaylistsDetailsVC: UITableViewController {
    
    var playlist:MPMediaPlaylist!
    var player: SWAudioPlayer!
    //let player: Player!
    //var didSelectPlayable: ((Playable, Int) -> Void )?

    
//    init(player: Player, playlist: MPMediaPlaylist ) {
//        self.player = player
//        self.playlist = playlist
//        super.init(style: .plain)
//
//        //register custom cell
//        self.tableView.register(UINib(nibName: "PlaylistCell", bundle: nil), forCellReuseIdentifier: PlaylistCell.reuseIdentifier)
//        self.title = playlist.name
//        //self.navigationController?.setNavigationBarHidden(false, animated: true)
//    }
    
    //Not Used
//    init(didSelectPlayable: ((Playable, Int?) -> Void )?, playlist: MPMediaPlaylist) {
//        self.didSelectPlayable = didSelectPlayable
//        self.playlist = playlist
//        super.init(style: .plain)
//    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        //fatalError("init(coder:) has not been implemented")
    }
    
    override init(style: UITableViewStyle) {
        //fatalError("Don't use this initializer")
        super.init(style: style)
        self.tableView.register(UINib(nibName: "PlaylistCell", bundle: nil), forCellReuseIdentifier: PlaylistCell.reuseIdentifier)

    }
    
    func scollToActiveItem() {
//        let count = playlist.items.count
//        for i in 0 ..< count {
//            if player.mediaItem.persistentID == playlist.items[i].persistentID {
//                let indexPath = IndexPath(row: i, section: 0)
//                tableView.scrollToRow(at: indexPath, at: .top, animated: false)
//            }
//        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismissVC) )
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        scollToActiveItem()
    }
    
    @objc func dismissVC() {
        self.dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return playlist.items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PlaylistCell.reuseIdentifier, for: indexPath) as? PlaylistCell else {
            fatalError("Unexpected Index Path")
        }
        let track = playlist.items[indexPath.row]
        cell.configure(track: track, isSelected: false)
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75.0
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        tableView.reloadData()
        player.playbackItems = playlist.items
        player.lastTime = 0
        player.playItem(playlist.items[indexPath.row])
        self.dismissVC()
    }
    
}
