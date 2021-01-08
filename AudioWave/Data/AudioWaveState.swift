//
//  AudioWaveState.swift
//  AudioWave
//
//  Created by Aaron Anthony on 2020-02-26.
//  Copyright © 2020 SphericalWave. All rights reserved.
//

import Foundation

struct AudioWaveState: Codable {
    let musicPlayerState: AudioPlayerState
    let audioPlayerState: AudioPlayerState
    let crossFader: Float
    let activeScreen: Int
}
