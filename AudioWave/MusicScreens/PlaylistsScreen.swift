//
//  MusicPlaylistScreen.swift
//  AudioWave
//
//  Created by Aaron Anthony on 2020-01-25.
//  Copyright © 2020 SphericalWave. All rights reserved.
//

import UIKit
import MediaPlayer

class PlaylistsScreen: SwStaticTable    //FIXME: Lists
{
    let audioPlayer: AudioSource    //FIXME: Naming
    
    init(data: SwStaticTableData, audioPlayer: AudioSource) {
        self.audioPlayer = audioPlayer
        super.init(data: data, hideBottomBar: false)
        self.title = "Music Playlists"
        navigationItem.leftBarButtonItem = SwDismissButton(parentScreen: self) 
    }
    required init?(coder aDecoder: NSCoder) { fatalError() }
}

class PlaylistsScreenData: SwStaticTableData
{
    init(musicPlaylists: [Playlist], musicPlayer: AudioSource) {   //FIXME: Code in Constructor
        var cells = [SwCell]()
        for playlist in musicPlaylists {
            let playlistCell = PlaylistCell(playlist: playlist, musicPlayer: musicPlayer)
            cells.append(playlistCell)
        }
        super.init(sections: [cells])
    }
}
