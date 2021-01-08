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
    private let audioHardware = AudioHardware()
    let audioWave: AudioWave

    init() {
        let mPS = AudioPlayerState(playlistID: 600, trackID: 600, rate: 1.0, volume: 1.0)   //FIXME: IDs are wrong
        let musicSource = AudioSource(state: mPS)

        let aPS = AudioPlayerState(playlistID: 600, trackID: 600, rate: 1.0, volume: 1.0)   //FIXME: IDs are wrong
        let bookSource = AudioSource(state: aPS) //FIXME: Naming
        self.audioWave = AudioWave(musicSource: musicSource, bookSource: bookSource)
        
        self.remote = Remote(audioSource1: musicSource, audioSource2: bookSource)
        audioHardware.activate()
    }
}
