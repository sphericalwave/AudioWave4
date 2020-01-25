//
//  PlaylistScreen.swift
//  AudioWave
//
//  Created by Aaron Anthony on 2020-01-25.
//  Copyright © 2020 SphericalWave. All rights reserved.
//

import UIKit

class PlaylistScreen: SwStaticTable
{
    let playlist: Playlist
    
    init(playlist: Playlist) {
        self.playlist = playlist
        let track1 = playlist.track(at: 0)
        let cell3 = TrackCell(name: track1.title(), artist: track1.artist(), art: track1.art())
        let data = SwStaticTableData(sections: [[cell3]])
        super.init(data: data, hideBottomBar: false)
        self.title = playlist.name()
        navigationItem.rightBarButtonItem = SwDismissButton(parentScreen: self)
    }
    
    required init?(coder aDecoder: NSCoder) { fatalError() }
}
