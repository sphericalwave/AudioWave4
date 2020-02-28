//
//  ContentPlaylistScreen.swift
//  AudioWave
//
//  Created by Aaron Anthony on 2020-02-28.
//  Copyright © 2020 SphericalWave. All rights reserved.
//

import UIKit
import MediaPlayer

class ContentPlaylistScreen: SwStaticTable
{
    init(data: ContentPlaylistScreenData) {
        super.init(data: data, hideBottomBar: false)
        self.title = data.name()
        navigationItem.rightBarButtonItem = SwDismissButton(parentScreen: self)
    }
    required init?(coder aDecoder: NSCoder) { fatalError() }
}


class ContentPlaylistScreenData: SwStaticTableData
{
    let playlist: MPMediaItemCollection
    
    init(playlist: MPMediaItemCollection) {
        self.playlist = playlist
        var trackCells = [TrackCell]()
        for track in playlist.items {
            let trackCell = TrackCell(mediaItem: track)
            trackCells.append(trackCell)
        }
        super.init(sections: [trackCells])
    }
    
    func name() -> String { return "FIXME" }
}
