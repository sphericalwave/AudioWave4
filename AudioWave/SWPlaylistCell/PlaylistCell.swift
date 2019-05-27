//
//  PlaylistCell.swift
//  AudioWave2
//
//  Created by Aaron Anthony on 2017-06-09.
//  Copyright © 2017 SphericalWave. All rights reserved.
//

import UIKit
import MediaPlayer

class PlaylistCell: UITableViewCell {
    
    static let reuseIdentifier = "playlistCell"
    var isIndicating = false
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var musicArt: UIImageView!
    @IBOutlet weak var indicator: UIImageView!
    
    override func awakeFromNib() {
        musicArt.layer.cornerRadius = 10.0
        musicArt.clipsToBounds = true
    }
    
//    func configurePlaylistCell(mediaItem: MPMediaItem, indicator: Bool, title: String) {
//        //let playlist = playlists[indexPath.row]
//        let size = self.musicArt.bounds.size
//        self.musicArt.layer.cornerRadius = 3.0
//        self.musicArt.clipsToBounds = true
//        if let image = mediaItem.artwork?.image(at: size){
//            self.musicArt.image = image
//        }
//        else{
//            self.musicArt.image = UIImage(named: "mediumNote.png")
//        }
//        //let name = playlist.name
//        self.titleLabel.text = title
//        self.accessoryType = .disclosureIndicator
//        self.detailLabel.isHidden = true
//        self.indicator.isHidden = indicator
//    }
//
//    func configureAudiobookCell(mediaItem: MPMediaItem, indicator: Bool) {
//        //let playlist = playlists[indexPath.row]
//        let size = self.musicArt.bounds.size
//        self.musicArt.layer.cornerRadius = 3.0
//        self.musicArt.clipsToBounds = true
//        if let image = mediaItem.artwork?.image(at: size){
//            self.musicArt.image = image
//        }
//        else{
//            self.musicArt.image = UIImage(named: "mediumNote.png")
//        }
//        //let name = playlist.name
//        self.titleLabel.text = mediaItem.albumTitle
//        self.detailLabel.text = mediaItem.artist
//        self.accessoryType = .disclosureIndicator
//        self.detailLabel.isHidden = false
//        self.indicator.isHidden = indicator
//    }
    func configure(collection: MPMediaItemCollection, isSelected: Bool = false) {
        if let playlist = collection as? MPMediaPlaylist {
            self.musicArt.image = #imageLiteral(resourceName: "mediumNote")
            self.titleLabel.text = playlist.name
        } else {
            // We have an audiobook
            self.musicArt.image = #imageLiteral(resourceName: "mediumBook")
            self.titleLabel.text = collection.representativeItem?.albumTitle
            self.detailLabel.text = collection.representativeItem?.artist
            self.indicator.image = #imageLiteral(resourceName: "play")
        }
        self.accessoryType = .disclosureIndicator
        self.indicator.isHidden = !isSelected
        
        let size = self.musicArt.bounds.size
        if let image = collection.representativeItem?.artwork?.image(at: size) {
            self.musicArt.image = image
        }
    }
    
    func configure(track: MPMediaItem, isSelected: Bool) {
        self.titleLabel.text = track.title
        self.detailLabel.text = String(track: track)
        self.accessoryType = .none
        self.indicator.isHidden = !isSelected
        
        let size = self.musicArt.bounds.size
        if let image = track.artwork?.image(at: size){
            self.musicArt.image = image
        } else {
            self.musicArt.image = track.mediaType == .music ? #imageLiteral(resourceName: "mediumNote") : #imageLiteral(resourceName: "mediumBook")
        }
    }
}
