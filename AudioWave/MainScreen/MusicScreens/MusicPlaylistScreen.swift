//
//  PlaylistScreen.swift
//  AudioWave
//
//  Created by Aaron Anthony on 2020-01-25.
//  Copyright © 2020 SphericalWave. All rights reserved.
//

import UIKit

class MusicPlaylistScreen: SwStaticTable
{
    init(data: MusicPlaylistScreenData) {
        super.init(data: data, hideBottomBar: false)
        self.title = data.name()
        navigationItem.rightBarButtonItem = SwDismissButton(parentScreen: self)
    }
    required init?(coder aDecoder: NSCoder) { fatalError() }
}

import MediaPlayer

class MusicPlaylistScreenData: SwStaticTableData
{
    let playlist: MPMediaPlaylist
    
    init(playlist: MPMediaPlaylist, musicPlayer: MusicPlayer) {
        self.playlist = playlist
        var trackCells = [TrackCell]()
        for track in playlist.items {
            let trackCell = TrackCell(mediaItem: track, musicPlayer: musicPlayer)
            trackCells.append(trackCell)
        }
        super.init(sections: [trackCells])
    }
    
    func name() -> String { return playlist.name ?? "FIXME" }
}
