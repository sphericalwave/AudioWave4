//
//  PlaylistScreen.swift
//  AudioWave
//
//  Created by Aaron Anthony on 2020-01-25.
//  Copyright © 2020 SphericalWave. All rights reserved.
//

import UIKit
import MediaPlayer

class MusicPlaylistScreen: SwStaticTable
{
    init(data: MusicPlaylistScreenData) {
        super.init(data: data, hideBottomBar: false)
        self.title = data.name()
        navigationItem.rightBarButtonItem = SwDismissButton(parentScreen: self)
    }
    required init?(coder aDecoder: NSCoder) { fatalError() }
}

class MusicPlaylistScreenData: SwStaticTableData
{
    let playlist: Playlist
    
    init(playlist: Playlist, musicPlayer: MusicPlayer) {
        self.playlist = playlist
        var trackCells = [TrackCell]()
        for track in playlist.mediaItems() {
            let trackCell = TrackCell(mediaItem: track, musicPlayer: musicPlayer, playlist: playlist)
            trackCells.append(trackCell)
        }
        super.init(sections: [trackCells])
    }
    
    func name() -> String { return playlist.name() }
}
