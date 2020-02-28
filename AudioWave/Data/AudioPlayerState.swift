//
//  AudioPlayerState.swift
//  AudioWave
//
//  Created by Aaron Anthony on 2020-02-26.
//  Copyright © 2020 SphericalWave. All rights reserved.
//

import MediaPlayer

class AudioPlayerState: Codable
{
    let playlistID: MPMediaEntityPersistentID
    let trackID: MPMediaEntityPersistentID
    let rate: Float
    let volume: Float
    
    init(playlistID: MPMediaEntityPersistentID, trackID: MPMediaEntityPersistentID, rate: Float, volume: Float) {
        self.playlistID = playlistID
        self.trackID = trackID
        self.rate = rate
        self.volume = volume
    }
}
