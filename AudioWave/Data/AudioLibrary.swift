//
//  MediaLibrary.swift
//  AudioWave2
//
//  Created by Aaron Anthony on 2017-06-10.
//  Copyright © 2017 SphericalWave. All rights reserved.
//

import Foundation
import MediaPlayer

class AudioLibrary
{
    init() {
        MPMediaLibrary.requestAuthorization() { status in   //FIXME: Fragile
            if status != .authorized { fatalError() }
        }
    }
    
    //FIXME: Gnarly
    func playlists() -> [Playlist] {
        var everything = [Playlist]()
        if let musicPlaylists1 = musicPlaylists() { //FIXME: Naming
            for m in musicPlaylists1 { everything.append(Playlist(mediaItemCollection:m)) }
        }
        if let audioContent = audioBooks() {
            for a in audioContent { everything.append(Playlist(mediaItemCollection:a)) }
        }
        return everything
    }
    
    func musicPlaylists() -> [MPMediaPlaylist]? {
        let query = MPMediaQuery.playlists()
        let predicate = MPMediaPropertyPredicate(value: MPMediaType.music.rawValue, forProperty: MPMediaItemPropertyMediaType)
        query.addFilterPredicate(predicate)
        return query.collections as? [MPMediaPlaylist]
    }
    
    func audioBooks() -> [MPMediaItemCollection]? {
        let query = MPMediaQuery.audiobooks()
        let audioBooks = query.collections
        return audioBooks
    }
    
    func findPlaylist(with ID: MPMediaEntityPersistentID) -> MPMediaPlaylist? {
        let query = MPMediaQuery.playlists()
        let predicate = MPMediaPropertyPredicate(value: MPMediaType.music.rawValue, forProperty: MPMediaItemPropertyMediaType)
        query.addFilterPredicate(predicate)
        return (query.collections as? [MPMediaPlaylist])?.filter({ $0.persistentID == ID }).first
    }
    
    func findAudioBook(with ID: MPMediaEntityPersistentID) -> MPMediaItemCollection? {
        let query = MPMediaQuery.audiobooks()
        return query.collections?.filter({ $0.persistentID == ID }).first
    }
    
    func findItem(with ID: MPMediaEntityPersistentID, queue: MPMediaItemCollection) -> MPMediaItem? {
        return queue.items.filter({ $0.persistentID == ID }).first
    }
}
