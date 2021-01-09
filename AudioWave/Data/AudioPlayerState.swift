//
//  AudioPlayerState.swift
//  AudioWave
//
//  Created by Aaron Anthony on 2020-02-26.
//  Copyright © 2020 SphericalWave. All rights reserved.
//

import MediaPlayer

struct AudioPlayerState: Codable {
    let playlistID: MPMediaEntityPersistentID
    let trackID: MPMediaEntityPersistentID
    let rate: Float
    let volume: Float
}
