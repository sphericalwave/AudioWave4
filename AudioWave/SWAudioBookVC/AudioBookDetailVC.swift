//
//  AudioBookDetailVC.swift
//  AudioWave2
//
//  Created by Aaron Anthony on 2017-06-11.
//  Copyright © 2017 SphericalWave. All rights reserved.
//



import UIKit
import MediaPlayer

class AudioBookDetailVC: UITableViewController {
    
    var book:MPMediaItemCollection!
    //let player: Player! //TODO: This Can Go
//    var didSelectPlayable: ((Playable, Int) -> Void )?
//    var selectedChapter: MPMediaItem?
//    var loop: Loop!
    
    var player: SWAudioPlayer!

    
    
//    init(player: Player, audioBook: MPMediaItemCollection ) {
//        //self.player = player
//        self.playlist = audioBook
//        super.init(style: .plain)
//
//        //register custom cell
//        self.tableView.register(UINib(nibName: "PlaylistCell", bundle: nil), forCellReuseIdentifier: PlaylistCell.reuseIdentifier)
//        self.title = playlist.representativeItem?.albumTitle
//        //Show NavBar
//        //self.navigationController?.setNavigationBarHidden(false, animated: true)
//    }
    
    init(audioBook: MPMediaItemCollection) {
        self.book = audioBook
        super.init(style: .plain)
        
        //register custom cell
        self.tableView.register(UINib(nibName: "PlaylistCell", bundle: nil), forCellReuseIdentifier: PlaylistCell.reuseIdentifier)
        self.title = book.representativeItem?.albumTitle
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.backBarButtonItem?.title = "Back"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //scollToActiveItem()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(style: UITableView.Style) {
        //fatalError("Don't use this initializer")
        super.init(style: style)
        self.tableView.register(UINib(nibName: "PlaylistCell", bundle: nil), forCellReuseIdentifier: PlaylistCell.reuseIdentifier)
        
    }
    
//    func scollToActiveItem() {
//        let count = playlist.items.count
//        for i in 0 ..< count {
//            if player.mediaItem.persistentID == playlist.items[i].persistentID {
//                let indexPath = IndexPath(row: i, section: 0)
//                tableView.scrollToRow(at: indexPath, at: .top, animated: false)
//            }
//        }
//    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return book.items.count
    }
    
    @objc func dismiss() {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PlaylistCell.reuseIdentifier, for: indexPath) as? PlaylistCell else {
            fatalError("Unexpected Index Path")
        }
        let track = book.items[indexPath.row]
        cell.configure(track: track, isSelected: false)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75.0
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        tableView.deselectRow(at: indexPath, animated: true)
//        tableView.reloadData()
//
//        guard let didSelectPlayable = didSelectPlayable else {
//            return
//        }
//        didSelectPlayable(book, indexPath.row)
//        //self.dismiss()
        
        tableView.deselectRow(at: indexPath, animated: true)
        tableView.reloadData()
        player.playbackItems = book.items
        player.lastTime = 0
        player.playItem(book.items[indexPath.row])
        self.dismiss()
    }
    
}
