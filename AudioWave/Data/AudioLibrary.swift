//
//  MediaLibrary.swift
//  AudioWave2
//
//  Created by Aaron Anthony on 2017-06-10.
//  Copyright © 2017 SphericalWave. All rights reserved.
//

import Foundation
import MediaPlayer

enum AudioLibrary {
    static func playlists() -> [Playlist] {
        musicPlaylists().map(Playlist.init) + audioBooks().map(Playlist.init)
    }

    private static func musicPlaylists() -> [MPMediaPlaylist] {
        let query = MPMediaQuery.playlists()
        let predicate = MPMediaPropertyPredicate(value: MPMediaType.music.rawValue, forProperty: MPMediaItemPropertyMediaType)
        query.addFilterPredicate(predicate)
        return query.collections as? [MPMediaPlaylist] ?? []
    }

    private static func audioBooks() -> [MPMediaItemCollection] {
        let query = MPMediaQuery.audiobooks()
        let audioBooks = query.collections
        return audioBooks ?? []
    }

//    static func findPlaylist(with ID: MPMediaEntityPersistentID) -> MPMediaPlaylist? {
//        let query = MPMediaQuery.playlists()
//        let predicate = MPMediaPropertyPredicate(value: MPMediaType.music.rawValue, forProperty: MPMediaItemPropertyMediaType)
//        query.addFilterPredicate(predicate)
//        return (query.collections as? [MPMediaPlaylist])?.filter({ $0.persistentID == ID }).first
//    }
//
//    static func findAudioBook(with ID: MPMediaEntityPersistentID) -> MPMediaItemCollection? {
//        let query = MPMediaQuery.audiobooks()
//        return query.collections?.filter({ $0.persistentID == ID }).first
//    }
//
//    static func findItem(with ID: MPMediaEntityPersistentID, queue: MPMediaItemCollection) -> MPMediaItem? {
//        return queue.items.filter({ $0.persistentID == ID }).first
//    }
}
