//
//  ContentPlayer.swift
//  AudioWave
//
//  Created by Aaron Anthony on 2020-02-28.
//  Copyright © 2020 SphericalWave. All rights reserved.
//

import Foundation
import MediaPlayer
import AVFoundation

class ContentPlayer: AudioPlayer
{
    let state: AudioPlayerState
    var player: AVAudioPlayer!
    
    init(state: AudioPlayerState) {
        self.state = state
        //observeAudioSession()
        //setupRemoteControl()
        //let player = try AVAudioPlayer(contentsOf: T##URL)
    }
    
    func play(_ mediaItem: MPMediaItem) {
        self.player = try! AVAudioPlayer(contentsOf: mediaItem.assetURL!)   //FIXME: Fragile
        player.prepareToPlay()
        player.play()
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
