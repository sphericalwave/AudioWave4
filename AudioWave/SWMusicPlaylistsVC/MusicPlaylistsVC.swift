//
//  MusicPlaylistsVC.swift
//  AudioWave2
//
//  Created by Aaron Anthony on 2017-06-09.
//  Copyright © 2017 SphericalWave. All rights reserved.
//

import UIKit
import MediaPlayer
//import GoogleMobileAds


class MusicPlaylistsVC: UITableViewController {
    
    var playlists:[MPMediaPlaylist]
    var player: SWAudioPlayer!
    //var bannerView: GADBannerView!
    //var didSelectPlayable: ((Playable, Int) -> Void )?
    
//    static func storyboardInstance(didSelectPlayable: ((Playable, Int?) -> Void )? ) -> UINavigationController {
////        let storyBoard = UIStoryboard(name: "MusicPlaylists", bundle: nil)
////        let nav = storyBoard.instantiateInitialViewController() as! UINavigationController
////        //let musicPlaylistsVC = nav.topViewController as! MusicPlaylistsVC
////        return nav
//        //Initialize Properties
//
////        let musicPlaylistVC = MusicPlaylistsVC(player: player)
////
////        //Function Passing
////        musicPlaylistVC.didSelectPlayable = { playableItem, index in
////            self.configure(for: playableItem, at: index)
////        }
////        let navController = UINavigationController(rootViewController: musicPlaylistVC)
////        navController.navigationBar.barStyle = .black
////        navController.navigationBar.isTranslucent = false
////        self.present(navController, animated: true, completion: nil)
//
//        let storyboard = UIStoryboard.init(name: "MusicPlaylists", bundle: nil)
//        let nav = storyboard.instantiateInitialViewController() as! UINavigationController
//        let musicPlaylistsVC = nav.topViewController as! MusicPlaylistsVC
//
//        //Initialize Properties
////        musicPlaylistsVC.audioBook = (player as! MusicPlayer).queue
////        musicPlaylistsVC.chapter = (player as! MusicPlayer).mediaItem
////       // bookRecorderVC.ideaIndex = ideaIndex
//        musicPlaylistsVC.didSelectPlayable = didSelectPlayable
//        return nav
//    }
    
    @objc func dismissVC() {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    //MARK: - Initializers
//    init(player: SWAudioPlayer) {
//        self.player = player
//        if let musicPlaylists = MediaLibrary.musicPlaylists() {
//            self.playlists = musicPlaylists
//        }
//        else {
//            self.playlists = [MPMediaPlaylist]()
//        }
//        super.init(style: .plain)
//
//        //register custom cell
//        self.tableView.register(UINib(nibName: "PlaylistCell", bundle: nil), forCellReuseIdentifier: PlaylistCell.reuseIdentifier)
//        //tableView.rowHeight = UITableViewAutomaticDimension
//        //tableView.estimatedRowHeight = 72
//
//        self.title = "Music Playlists"
//        //navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
//    }
    
    required init?(coder aDecoder: NSCoder) {

//        //Set Player in Caller
//        self.player = nil
//        //Set Playable in Caller
        


        if let musicPlaylists = LibaryAcessor.musicPlaylists() {
            self.playlists = musicPlaylists
        }
        else {
            self.playlists = [MPMediaPlaylist]()
        }

        super.init(coder: aDecoder)
        
        //register custom cell
        self.tableView.register(UINib(nibName: "PlaylistCell", bundle: nil), forCellReuseIdentifier: PlaylistCell.reuseIdentifier)
        //tableView.rowHeight = UITableViewAutomaticDimension
        //tableView.estimatedRowHeight = 72

        //REgister for TableCells
//        self.tableView.register(UINib(nibName: "PlaylistCell", bundle: nil), forCellReuseIdentifier: PlaylistCell.reuseIdentifier)

    }
    
    override init(style: UITableView.Style) {
        //fatalError("Don't use this initializer")
                if let musicPlaylists = LibaryAcessor.musicPlaylists() {
                    self.playlists = musicPlaylists
                }
                else {
                    self.playlists = [MPMediaPlaylist]()
                }
        super.init(style: style)
        self.tableView.register(UINib(nibName: "PlaylistCell", bundle: nil), forCellReuseIdentifier: PlaylistCell.reuseIdentifier)

    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        super.viewWillAppear(animated)
    }
    
    func scollToActiveItem() {
//        let count = playlists.count
//        for i in 0 ..< count {
//            if player.queue.persistentID == playlists[i].persistentID {
//                let indexPath = IndexPath(row: i, section: 0)
//                tableView.scrollToRow(at: indexPath, at: .top, animated: false)
//            }
//        }
    }
    
    //MARK: - View Lifecyle
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        scollToActiveItem()
        self.tableView.reloadData()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismissVC))
        self.title = "Music Playlists"
        
        //setRightNavButton()
        //setupDimmingView()
        //setupAdvertising()
    }
    

    

    
    
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return playlists.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PlaylistCell.reuseIdentifier, for: indexPath) as? PlaylistCell else {
            fatalError("Unexpected Index Path")
        }
        let playlist = playlists[indexPath.row]
        cell.configure(collection: playlist, isSelected: false)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 72
    }
    
    
    //MARK: - Navigation
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let playlistDetailVC = PlaylistsDetailsVC(style: .plain)
        playlistDetailVC.playlist = playlists[indexPath.row]
        playlistDetailVC.player = player
        self.navigationController?.pushViewController(playlistDetailVC, animated: true)
    }

}
