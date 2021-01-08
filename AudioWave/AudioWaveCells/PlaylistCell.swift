//
//  PlaylistCell.swift
//  AudioWave2
//
//  Created by Aaron Anthony on 2017-06-09.
//  Copyright © 2017 SphericalWave. All rights reserved.
//

import UIKit
import MediaPlayer

class PlaylistCell: AudioWaveCell
{
    let playlist: Playlist
    
    init(playlist: Playlist, musicPlayer: AudioSource) {
        self.playlist = playlist
        super.init(musicPlayer: musicPlayer)   //FIXME: Scrap XIB
        accessoryType = .disclosureIndicator
    }
    required init?(coder: NSCoder) { fatalError() }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = playlist.name
        detailLabel.text = playlist.details
    }
    
    override func didSelect() {
        let data = PlaylistDetailsData(playlist: playlist, musicPlayer: audioSource)
        let playlistScreen = PlaylistDetailsScreen(data: data)
        navigationController?.pushViewController(playlistScreen, animated: true)
    }
    override func updateArt() {
        guard let art = playlist.artwork else {
            guard let noteList = UIImage(systemName: "music.note.list") else { fatalError() }
            artwork.image = noteList
            return
        }
        artwork.refresh(with: art)
    }
}

