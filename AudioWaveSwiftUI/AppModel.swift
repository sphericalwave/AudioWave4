//
//  AppModel.swift
//  AudioWave SwiftUI
//
//  Created by Jacob Christie on 2021-01-08.
//  Copyright © 2021 SphericalWave. All rights reserved.
//

import Combine

final class AppModel: ObservableObject {
    private let remote: Remote
    let audioHardware = AudioHardware()
    let audioSource1: AudioSource
    let audioSource2: AudioSource

    init() {
        let mPS = AudioPlayerState(playlistID: 600, trackID: 600, rate: 1.0, volume: 1.0)   //FIXME: IDs are wrong
        let audioSource1 = AudioSource(state: mPS)
        self.audioSource1 = audioSource1

        let aPS = AudioPlayerState(playlistID: 600, trackID: 600, rate: 1.0, volume: 1.0)   //FIXME: IDs are wrong
        let audioSource2 = AudioSource(state: aPS) //FIXME: Naming
        self.audioSource2 = audioSource2
        
        self.remote = Remote(audioSource1: audioSource1, audioSource2: audioSource2)
        audioHardware.activate()
    }
}
