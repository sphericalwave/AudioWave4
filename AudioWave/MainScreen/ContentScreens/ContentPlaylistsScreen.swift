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
    init(data: SwStaticTableData) {
        super.init(data: data, hideBottomBar: false)
        self.title = "Content Playlists"
        navigationItem.leftBarButtonItem = SwDismissButton(parentScreen: self)
    }
    required init?(coder aDecoder: NSCoder) { fatalError() }
}

class ContentPlaylistsScreenData: SwStaticTableData
{
    let contentPlayer: MusicPlayer //FIXME: Naming

    init(contentPlaylists: [MPMediaItemCollection], contentPlayer: MusicPlayer) {   //FIXME: Code in Constructor
        self.contentPlayer = contentPlayer
        var cells = [SwCell]()
        for playlist in contentPlaylists {
            let playlistCell = ContentPlaylistCell(playlist: playlist, contentPlayer: contentPlayer)  //FIXME: Naming
            cells.append(playlistCell)
        }
        super.init(sections: [cells])
    }
}
