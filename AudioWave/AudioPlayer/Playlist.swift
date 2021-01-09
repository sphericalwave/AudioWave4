//
//  Playlist.swift
//  AudioWave
//
//  Created by Aaron Anthony on 2020-01-25.
//  Copyright © 2020 SphericalWave. All rights reserved.
//

import UIKit
import MediaPlayer

struct PlaylistController {
    let playlist: Playlist
    private var currentIndex: Int = 0 //FIXME: Be Immutable

    init(playlist: Playlist) {
        self.playlist = playlist
    }

    mutating func next() -> MPMediaItem {    //FIXME: Loop Back Around
        currentIndex += 1
        if currentIndex == playlist.endIndex {
            currentIndex = 0
        }
        return playlist[currentIndex]
    }

    mutating func previous() -> MPMediaItem { //FIXME: Loop Back Around
        currentIndex -= 1
        if currentIndex <= playlist.startIndex {
            currentIndex = playlist.endIndex - 1
        }
        return playlist[currentIndex]
    }

    mutating func play(_ mediaItem: MPMediaItem) {   //FIXME: To Keep Playlist in Sync
        guard let newIndex = playlist.firstIndex(of: mediaItem) else { fatalError() }
        currentIndex = newIndex
    }

    var currentItem: MPMediaItem {
        playlist[currentIndex]
    }
}

struct Playlist //FIXME: Codable
{
    private let mediaItemCollection: MPMediaItemCollection

    init(mediaItemCollection: MPMediaItemCollection) {
        self.mediaItemCollection = mediaItemCollection
    }
    
    var name: String { //FIXME: Naming, mainText() -> String
        if let playlist = mediaItemCollection as? MPMediaPlaylist {
            return playlist.name ?? "Unnamed Playlist"
        }
        return mediaItemCollection.representativeItem?.albumTitle ?? "Unnamed Audiobook"
    }
    
    var details: String {  //FIXME: Extend MPMediaItemCollection
        if let playlist = mediaItemCollection as? MPMediaPlaylist {
            return playlist.name ?? "Unnamed Playlist Details"
        }
        return mediaItemCollection.representativeItem?.albumTitle ?? "Unnamed Audiobook Details"
    }

    var artwork: MPMediaItemArtwork? {
        mediaItemCollection.representativeItem?.artwork
    }
    //FIXME: Handle MPMediaPlaylist condition
}


extension Playlist: Collection {
    typealias Index = Int
    typealias Element = MPMediaItem

    var startIndex: Int {
        mediaItemCollection.items.startIndex
    }

    var endIndex: Int {
        mediaItemCollection.items.endIndex
    }

    func index(after i: Int) -> Int {
        mediaItemCollection.items.index(after: i)
    }

    subscript(position: Int) -> MPMediaItem {
        let item = mediaItemCollection.items[position]
        return item
    }
}
