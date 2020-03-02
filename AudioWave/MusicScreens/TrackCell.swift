//
//  TrackCell.swift
//  AudioWave
//
//  Created by Aaron Anthony on 2020-01-25.
//  Copyright © 2020 SphericalWave. All rights reserved.
//

import UIKit
import MediaPlayer

class TrackCell: SwCell
{
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var artwork: UIImageView!
    @IBOutlet weak var indicator: UIImageView!
    let mediaItem: MPMediaItem
    let musicPlayer: AudioSource
    let playlist: Playlist
    override func height() -> CGFloat { return 81 }     //FIXME: What's the cleanest way to do this?
    
    init(mediaItem: MPMediaItem, musicPlayer: AudioSource, playlist: Playlist) {
        self.mediaItem = mediaItem
        self.musicPlayer = musicPlayer
        self.playlist = playlist
        super.init(nibName: "PlaylistCell2", bundle: nil)   //FIXME: Remove XIB
        accessoryType = .none
        selectionStyle = .default
    }
    required init?(coder: NSCoder) { fatalError() }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        artwork.layer.cornerRadius = 10.0   //FIXME: New Class RoundedImage
        artwork.clipsToBounds = true
        titleLabel.text = mediaItem.title ?? "FIXME"
        detailLabel.text = mediaItem.artist ?? "FIXME"
        updateArt()
    }
    
    override func didSelect() {
        musicPlayer.load(playlist)      //FIXME: Redundant after the initial load
        musicPlayer.load(mediaItem)     //FIXME: Could use an index to be more direct
        musicPlayer.play()
    }

    func updateArt() {
        guard let art = musicPlayer.artwork() else {
            artwork.image = #imageLiteral(resourceName: "mediumNote")  //FIXME: Use SFSymbol
            return
        }
        artwork.refresh(with: art)
    }
}
