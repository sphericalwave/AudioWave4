//
//  MusicPlaylistScreen.swift
//  AudioWave
//
//  Created by Aaron Anthony on 2020-01-25.
//  Copyright © 2020 SphericalWave. All rights reserved.
//

import UIKit

class MusicPlaylistScreen: SwStaticTable
{
    let musicPlaylists: MusicPlaylists
    
    init(musicPlaylists: MusicPlaylists) {
        self.musicPlaylists = musicPlaylists
        let playlist1 = musicPlaylists.playlist(at: 0)
        let cell3 = PlaylistCell(name: playlist1.title(), artist: playlist1.artist(), art: playlist1.art())
        let data = SwStaticTableData(sections: [[cell3]])
        super.init(data: data, hideBottomBar: false)
        self.title = "Music"
        navigationItem.leftBarButtonItem = SwDismissButton(parentScreen: self)
    }
    
    required init?(coder aDecoder: NSCoder) { fatalError() }
}
