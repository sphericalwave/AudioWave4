//
//  ContentPlaylistsScreen.swift
//  AudioWave
//
//  Created by Aaron Anthony on 2020-02-28.
//  Copyright © 2020 SphericalWave. All rights reserved.
//

import UIKit
import MediaPlayer

class ContentPlaylistsScreen: SwStaticTable
{
    let contentPlayer: ContentPlayer
    
    init(data: SwStaticTableData, contentPlayer: ContentPlayer) {
        self.contentPlayer = contentPlayer
        super.init(data: data, hideBottomBar: false)
        self.title = "Content Playlists"
        navigationItem.leftBarButtonItem = SwDismissButton(parentScreen: self)
    }
    required init?(coder aDecoder: NSCoder) { fatalError() }
}

class ContentPlaylistsScreenData: SwStaticTableData
{
    init(contentPlaylists: [MPMediaItemCollection]) {   //FIXME: Code in Constructor
        var cells = [SwCell]()
        for playlist in contentPlaylists {
            let playlistCell = ContentPlaylistCell(playlist: playlist)  //FIXME: Naming
            cells.append(playlistCell)
        }
        super.init(sections: [cells])
    }
}
