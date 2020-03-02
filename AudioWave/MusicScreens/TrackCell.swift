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
    @IBOutlet weak var musicArt: UIImageView!
    @IBOutlet weak var indicator: UIImageView!
    let mediaItem: MPMediaItem
    let musicPlayer: MusicPlayer
    let playlist: Playlist
    override func height() -> CGFloat { return 81 }     //FIXME: What's the cleanest way to do this?
    
    init(mediaItem: MPMediaItem, musicPlayer: MusicPlayer, playlist: Playlist) {
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
        musicArt.layer.cornerRadius = 10.0
        musicArt.clipsToBounds = true
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
        let size = musicArt.bounds.size
        guard let sizedArt = mediaItem.artwork?.image(at: size) else {
            musicArt.image = #imageLiteral(resourceName: "mediumNote")  //FIXME: Use SFSymbol
            return
        }
        musicArt.image = sizedArt
    }
}
