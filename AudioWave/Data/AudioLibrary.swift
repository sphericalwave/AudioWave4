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
            if status != .authorized {
                fatalError()
            }
        }
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

//extension SWAudioPlayer {
//    func musicPlaylists() -> [MPMediaPlaylist]? {
//
//        let query = MPMediaQuery.playlists()
//        let predicate = MPMediaPropertyPredicate(value: MPMediaType.music.rawValue, forProperty: MPMediaItemPropertyMediaType)
//        query.addFilterPredicate(predicate)
//
//        return query.collections as? [MPMediaPlaylist]
//    }
//
//    func audioBooks() -> [MPMediaItemCollection]? {
//        let query = MPMediaQuery.audiobooks()
//        let audioBooks = query.collections
//        return audioBooks
//    }
//
//    func findPlaylist(with ID: MPMediaEntityPersistentID) -> MPMediaPlaylist? {
//        let query = MPMediaQuery.playlists()
//        let predicate = MPMediaPropertyPredicate(value: MPMediaType.music.rawValue, forProperty: MPMediaItemPropertyMediaType)
//        query.addFilterPredicate(predicate)
//        return (query.collections as? [MPMediaPlaylist])?.filter({ $0.persistentID == ID }).first
//    }
//
//    func findAudioBook(with ID: MPMediaEntityPersistentID) -> MPMediaItemCollection? {
//        let query = MPMediaQuery.audiobooks()
//        return query.collections?.filter({ $0.persistentID == ID }).first
//    }
//
//    func findItem(with ID: MPMediaEntityPersistentID, queue: MPMediaItemCollection) -> MPMediaItem? {
//        return queue.items.filter({ $0.persistentID == ID }).first
//    }
//
//    func findSongWithPersistentID(id: MPMediaEntityPersistentID) -> MPMediaItem? {
//        let predicate = MPMediaPropertyPredicate(value: id, forProperty: MPMediaItemPropertyPersistentID)
//        let query = MPMediaQuery()
//        query.addFilterPredicate(predicate)
//        var song: MPMediaItem?
//        if let items = query.items, items.count > 0 {
//            song = items[0]
//        }
//        return song
//    }
//}
