//
//  AudioWave.swift
//  AudioWave
//
//  Created by Aaron Anthony on 2020-01-25.
//  Copyright © 2020 SphericalWave. All rights reserved.
//

//Testing

import UIKit

class AudioWave: UINavigationController
{
    let remote: Remote
    let audioHardware = AudioHardware()
    
    init() {
        let mPS = AudioPlayerState(playlistID: 600, trackID: 600, rate: 1.0, volume: 1.0)   //FIXME: IDs are wrong
        let aPS = AudioPlayerState(playlistID: 600, trackID: 600, rate: 1.0, volume: 1.0)   //FIXME: IDs are wrong
        let state = AudioWaveState(musicPlayerState: mPS, audioPlayerState: aPS, crossFader: 0.5, activeScreen: 0)
        
        let audioSource1 = AudioSource(state: mPS)
        let p1 = AudioSourceUI(audioSource: audioSource1)
        
        let audioSource2 = AudioSource(state: aPS) //FIXME: Naming
        let p22 = AudioSourceUI(audioSource: audioSource2)
        
        let sS = Scroller(playbackScreen1: p1, playbackScreen2: p22, state: state)
        let cF = CrossFader(player1: audioSource1, player2: audioSource2)
        let mainScreen = MainScreen(scrollScreen: sS, crossFader: cF, audioSource1: audioSource1, audioSource2: audioSource2, audioLibrary: AudioLibrary())
        
        self.remote = Remote(audioSource1: audioSource1, audioSource2: audioSource2)
        super.init(rootViewController: mainScreen)
        navigationBar.barStyle = .black
        audioHardware.activate()
    }
    required init?(coder aDecoder: NSCoder) { fatalError("Ne Pas") }
}
