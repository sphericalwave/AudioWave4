//
//  AudioBooksVC.swift
//  AudioWave2
//
//  Created by Aaron Anthony on 2017-06-11.
//  Copyright © 2017 SphericalWave. All rights reserved.
//

import UIKit
import MediaPlayer
//import GoogleMobileAds

//class AudioBooksVC: UITableViewController {
//    
//    var player: SWAudioPlayer!
////    var bannerView: GADBannerView!
//    var playerVC: PlaybackScreen!
//    
//    var audioBooks:[MPMediaItemCollection]
//    var selectedAudiobook: MPMediaItemCollection?
//    var selectedChapter: MPMediaItem?
//    
//    //MARK: - Initializers
//    required init?(coder aDecoder: NSCoder) {
//        //self.player = player
////        if let audioBooks = AudioLibrary.audioBooks() {
////            self.audioBooks = audioBooks
////        }
////        else {
////            self.audioBooks = [MPMediaItemCollection]()
////        }
//        //super.init(style: .plain)
//        super.init(coder: aDecoder)
//        
//        //register custom cell
//        //self.tableView.register(UINib(nibName: "PlaylistCell", bundle: nil), forCellReuseIdentifier: PlaylistCell.reuseIdentifier)
//        self.title = "AudioBooks"
//        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
//    }
//    
//    override init(style: UITableView.Style) {
//        if let audioBooks = AudioLibrary().audioBooks() {
//            self.audioBooks = audioBooks
//        }
//        else {
//            self.audioBooks = [MPMediaItemCollection]()
//        }
//        super.init(style: .plain)
//        self.tableView.register(UINib(nibName: "PlaylistCell", bundle: nil), forCellReuseIdentifier: PlaylistCell.reuseIdentifier)
//
//    }
//
//    //MARK: - Navigation
//    //TODO: Use Segue Subclass
//    @objc func dismissVC() {
//        self.dismiss(animated: true, completion: nil)
//    }
//    
//    //MARK: - Lifecycle
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismissVC))
//        
//        //TODO: Major Clunk
//        self.title = "AudioBooks"
//    }
//    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        self.tableView.reloadData()
//    }
//    
//    //MARK: - Scroll to Active
//    func scollToActiveItem() {
////        let count = audioBooks.count
////        for i in 0 ..< count {
////            if player.queue.persistentID == audioBooks[i].persistentID {
////                let indexPath = IndexPath(row: i, section: 0)
////                tableView.scrollToRow(at: indexPath, at: .top, animated: false)
////            }
////        }
//    }
//    
//    // MARK: - TableView Delegates
//    
//    override func numberOfSections(in tableView: UITableView) -> Int {
//        return 1
//    }
//    
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return audioBooks.count
//    }
//    
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        
//        guard let cell = tableView.dequeueReusableCell(withIdentifier: PlaylistCell.reuseIdentifier, for: indexPath) as? PlaylistCell else {
//            fatalError("Unexpected Index Path")
//        }
//        let audioBook = audioBooks[indexPath.row]
//        cell.configure(collection: audioBook, isSelected: false)
//        return cell
//    }
//    
//    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 75.0
//    }
//    
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let audioBookDetailsVC = AudioBookDetailVC(style: .plain)
//        audioBookDetailsVC.book = audioBooks[indexPath.row]
//        audioBookDetailsVC.player = player
//        self.navigationController?.pushViewController(audioBookDetailsVC, animated: true)
//    }
//    
//    //MARK: - Ads
//    func setupAdvertising() {
//        
////        bannerView = GADBannerView(adSize: kGADAdSizeFullBanner)
////        tableView.tableHeaderView = bannerView
//        tableView.tableHeaderView?.backgroundColor = .black
//        bannerView.adUnitID = "ca-app-pub-3940256099942544/6300978111"
//        bannerView.rootViewController = self
//        bannerView.load(GADRequest())
//        
//    }
//}
