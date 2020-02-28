//
//  ContentPlayer.swift
//  AudioWave
//
//  Created by Aaron Anthony on 2020-02-28.
//  Copyright © 2020 SphericalWave. All rights reserved.
//

import Foundation

class ContentPlayer: AudioPlayer
{
    let state: AudioPlayerState
    
    init(state: AudioPlayerState) {
        self.state = state
        //observeAudioSession()
        //setupRemoteControl()
        //let player = try AVAudioPlayer(contentsOf: T##URL)
    }
    
    func play() {
        //
    }
    
    func pause() {
        //
    }
    
    func next() {
        //
    }
    
    func previous() {
        //
    }
}
