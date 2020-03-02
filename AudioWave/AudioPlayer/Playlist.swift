//
//  Playlist.swift
//  AudioWave
//
//  Created by Aaron Anthony on 2020-01-25.
//  Copyright © 2020 SphericalWave. All rights reserved.
//

import UIKit
import MediaPlayer

class Playlist //: Codable
{
    let mediaItemCollection: MPMediaItemCollection
    var index: Int  //FIXME: Be Immutable
    
    init(mediaItemCollection: MPMediaItemCollection) {
        self.mediaItemCollection = mediaItemCollection
        self.index = 0
    }
    
    func name() -> String {
        //if mediaItemCollection is MPMediaPlaylist {  }
        return "FIXME"
    }
    
    func random() -> MPMediaItem {
        let count = mediaItemCollection.items.count
        index = Int(arc4random_uniform(UInt32(count)))
        return mediaItemCollection.items[index]
    }
    
    func next() -> MPMediaItem {
        index += 1
        return mediaItemCollection.items[index]
    }
    
    func previous() -> MPMediaItem {
        index -= 1
        return mediaItemCollection.items[index]
    }
    
    func mediaItems() -> [MPMediaItem] {
        return mediaItemCollection.items
    }
    
    func artwork() -> MPMediaItemArtwork? {
        return mediaItemCollection.representativeItem?.artwork
    }
    
    func play(_ mediaItem: MPMediaItem) {   //FIXME: To Keep Playlist in Sync
        guard let newIndex = mediaItemCollection.items.firstIndex(of: mediaItem) else { fatalError() }
        index = newIndex
    }
}

