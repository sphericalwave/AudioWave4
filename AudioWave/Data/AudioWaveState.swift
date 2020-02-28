//
//  AudioWaveState.swift
//  AudioWave
//
//  Created by Aaron Anthony on 2020-02-26.
//  Copyright © 2020 SphericalWave. All rights reserved.
//

import Foundation

class AudioWaveState: Codable
{
    let musicPlayerState: AudioPlayerState
    let audioPlayerState: AudioPlayerState
    let crossFader: Float
    let activeScreen: Int
    
    init(musicPlayerState: AudioPlayerState, audioPlayerState: AudioPlayerState, crossFader: Float, activeScreen: Int) {
        self.musicPlayerState = musicPlayerState
        self.audioPlayerState = audioPlayerState
        self.crossFader = crossFader
        self.activeScreen = activeScreen
    }
}
