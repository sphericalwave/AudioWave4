//
//  TrackCell.swift
//  AudioWave
//
//  Created by Aaron Anthony on 2020-01-25.
//  Copyright © 2020 SphericalWave. All rights reserved.
//

import UIKit
import MediaPlayer

class MediaCell: AudioWaveCell
{
    let mediaItem: MPMediaItem
    let playlist: Playlist
    
    init(mediaItem: MPMediaItem, musicPlayer: AudioSource, playlist: Playlist) {
        self.mediaItem = mediaItem
        self.playlist = playlist
        super.init(musicPlayer: musicPlayer)   //FIXME: Remove XIB
    }
    required init?(coder: NSCoder) { fatalError() }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = mediaItem.title ?? "FIXME"
        detailLabel.text = mediaItem.artist ?? "FIXME"
    }
    
    override func didSelect() {
        audioSource.load(playlist)      //FIXME: Redundant after the initial load
        audioSource.load(mediaItem)     //FIXME: Could use an index to be more direct
        audioSource.play()
        //self.navigationController?.popToRootViewController(animated: true)
        dismiss(animated: true, completion: nil)
    }
    
    override func updateArt() {
        guard let art = mediaItem.artwork else {
            guard let note = UIImage(systemName: "music.note") else { fatalError() }
            artwork.image = note
            return
        }
        artwork.refresh(with: art)
        //        fatalError("subclass")
    }
}
