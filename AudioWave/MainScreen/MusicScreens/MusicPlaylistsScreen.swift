//
//  MusicPlaylistScreen.swift
//  AudioWave
//
//  Created by Aaron Anthony on 2020-01-25.
//  Copyright © 2020 SphericalWave. All rights reserved.
//

import UIKit
import MediaPlayer

class MusicPlaylistsScreen: SwStaticTable
{
    let audioPlayer: AudioPlayer
    
    init(data: SwStaticTableData, audioPlayer: AudioPlayer) {
        self.audioPlayer = audioPlayer
        super.init(data: data, hideBottomBar: false)
        self.title = "Music Playlists"
        navigationItem.leftBarButtonItem = SwDismissButton(parentScreen: self) 
    }
    required init?(coder aDecoder: NSCoder) { fatalError() }
}

class MusicPlaylistsScreenData: SwStaticTableData
{
    init(musicPlaylists: [MPMediaPlaylist]) {   //FIXME: Code in Constructor
        var cells = [SwCell]()
        for playlist in musicPlaylists {
            let playlistCell = PlaylistCell(playlist: playlist)
            cells.append(playlistCell)
        }
        super.init(sections: [cells])
    }
}
