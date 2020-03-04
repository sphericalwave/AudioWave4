//
//  NowPlaying.swift
//  AudioWave
//
//  Created by Aaron Anthony on 2020-03-02.
//  Copyright © 2020 SphericalWave. All rights reserved.
//

//import MediaPlayer
//
//class NowPlaying
//{
//    let notifications = NotificationCenter.default //FIXME: Hidden Dependency
//    let nowPlaying = MPNowPlayingInfoCenter.default //FIXME: Hidden Dependency
//    let audioSource1: AudioSource
//    let audioSource2: AudioSource
//    
//    init(audioSource1: AudioSource, audioSource2: AudioSource) {
//        self.audioSource1 = audioSource1
//        self.audioSource2 = audioSource2
//        notifications.addObserver(self, selector: #selector(refresh), name: .didLoad, object: nil)
//    }
//    
//    @objc func refresh() {
//        let track1 = audioSource1.track()
//        let track2 = audioSource2.track()
//        nowPlaying().nowPlayingInfo = [ MPMediaItemPropertyTitle : track1, MPMediaItemPropertyArtist : track2]
//    }
//}
