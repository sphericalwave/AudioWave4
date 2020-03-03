//
//  PlaylistScreen.swift
//  AudioWave
//
//  Created by Aaron Anthony on 2020-01-25.
//  Copyright © 2020 SphericalWave. All rights reserved.
//

import UIKit
import MediaPlayer

class PlaylistDetailsScreen: SwStaticTable  //FIXME: Lists
{
    init(data: PlaylistDetailsData) {
        super.init(data: data, hideBottomBar: false)
        self.title = data.name()
        navigationItem.rightBarButtonItem = SwDismissButton(parentScreen: self)
    }
    required init?(coder aDecoder: NSCoder) { fatalError() }
}

class PlaylistDetailsData: SwStaticTableData
{
    let playlist: Playlist
    
    init(playlist: Playlist, musicPlayer: AudioSource) {
        self.playlist = playlist
        var trackCells = [MediaCell]()
        for track in playlist.mediaItems() {
            let trackCell = MediaCell(mediaItem: track, musicPlayer: musicPlayer, playlist: playlist)
            trackCells.append(trackCell)
        }
        super.init(sections: [trackCells])
    }
    
    func name() -> String { return playlist.name() }
}
