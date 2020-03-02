//
//  ContentPlayer.swift
//  AudioWave
//
//  Created by Aaron Anthony on 2020-02-28.
//  Copyright © 2020 SphericalWave. All rights reserved.
//

//import Foundation
//import MediaPlayer
//import AVFoundation
//
//class ContentPlayer: AudioPlayer
//{
//    let state: AudioPlayerState
//    var player: AVAudioPlayer!
//    var mediaItem: MPMediaItem?
//    
//    init(state: AudioPlayerState) {
//        self.state = state
//        //observeAudioSession()
//        //setupRemoteControl()
//        //let player = try AVAudioPlayer(contentsOf: T##URL)
//    }
//    
//    func play(_ mediaItem: MPMediaItem) {
//        self.player = try! AVAudioPlayer(contentsOf: mediaItem.assetURL!)   //FIXME: Fragile
//        player.prepareToPlay()
//        player.play()
//    }
//    
//    func play() {
//        //
//    }
//    
//    func pause() {
//        //
//    }
//    
//    func next() {
//        //
//    }
//    
//    func previous() {
//        //
//    }
//    
//    func speed(_ speed: Float) {
//        //FIXME:
//        fatalError()
//    }
//    func track() -> String { return "FIXME" }
//    func artist() -> String { return "FIXME" }
//    func album() -> String { return "FIXME" }
//    func playback(mode: PlayMode) { fatalError() }
//    
//    func artwork() -> MPMediaItemArtwork? {
//        return mediaItem?.artwork
//    }
//    
//    func elapsedTime() -> String { return "FIXME" }
//    func remainingTime() -> String { return "FIXME" }
//    func seekTo(percentage: Float) { fatalError() }
//    
//    func percentage() -> Float {
//        return 0.5 //FIXME: 
//    }
//    
//    func isPlaying() -> Bool {
//        fatalError()
//    }
//
//
//}
