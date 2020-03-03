//
//  Playlist.swift
//  AudioWave
//
//  Created by Aaron Anthony on 2020-01-25.
//  Copyright © 2020 SphericalWave. All rights reserved.
//

import UIKit
import MediaPlayer

class Playlist //FIXME: Codable
{
    let mediaItemCollection: MPMediaItemCollection
    var index: Int  //FIXME: Be Immutable
    
    init(mediaItemCollection: MPMediaItemCollection) {
        self.mediaItemCollection = mediaItemCollection
        self.index = 0
    }
    
    func name() -> String { //FIXME: Naming, mainText() -> String
        if let playlist = mediaItemCollection as? MPMediaPlaylist {
            return playlist.name ?? "Unnamed Playlist"
        }
        return mediaItemCollection.representativeItem?.albumTitle ?? "Unnamed Audiobook"
    }
    
    func details() -> String {  //FIXME: Extend MPMediaItemCollection
        if let playlist = mediaItemCollection as? MPMediaPlaylist {
            return playlist.name ?? "Unnamed Playlist Details"
        }
        return mediaItemCollection.representativeItem?.albumTitle ?? "Unnamed Audiobook Details"
    }
    
    func random() -> MPMediaItem {
        let count = mediaItemCollection.items.count
        index = Int(arc4random_uniform(UInt32(count)))
        return mediaItemCollection.items[index]
    }
    
    func next() -> MPMediaItem {    //FIXME: Loop Back Around
        index += 1
        if index == mediaItemCollection.items.count { index = 0 }
        return mediaItemCollection.items[index]
    }
    
    func previous() -> MPMediaItem { //FIXME: Loop Back Around
        index -= 1
        if index <= 0 { index = mediaItemCollection.items.count - 1 }
        return mediaItemCollection.items[index]
    }
    
    func mediaItems() -> [MPMediaItem] { return mediaItemCollection.items }
    
    func artwork() -> MPMediaItemArtwork? { return mediaItemCollection.representativeItem?.artwork }
    //FIXME: Handle MPMediaPlaylist condition
    
    func play(_ mediaItem: MPMediaItem) {   //FIXME: To Keep Playlist in Sync
        guard let newIndex = mediaItemCollection.items.firstIndex(of: mediaItem) else { fatalError() }
        index = newIndex
    }
    
    func currentItem() -> MPMediaItem {
        let item = mediaItemCollection.items[index]
        return item
    }
}

