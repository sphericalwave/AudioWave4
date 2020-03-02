//
//  AudioWave.swift
//  AudioWave
//
//  Created by Aaron Anthony on 2020-01-25.
//  Copyright © 2020 SphericalWave. All rights reserved.
//

import UIKit

class AudioWave: UINavigationController
{
    let remote: Remote
    
    init() {
        let mPS = AudioPlayerState(playlistID: 600, trackID: 600, rate: 1.0, volume: 1.0)   //FIXME: IDs are wrong
        let aPS = AudioPlayerState(playlistID: 600, trackID: 600, rate: 1.0, volume: 1.0)   //FIXME: IDs are wrong
        let state = AudioWaveState(musicPlayerState: mPS, audioPlayerState: aPS, crossFader: 0.5, activeScreen: 0)
        
        let musicPlayer = AudioSource(state: mPS)
        let p1 = PlayerScreen(player: musicPlayer)
        
        let contentPlayer = AudioSource(state: aPS) //FIXME: Naming
        let p22 = PlayerScreen(player: contentPlayer)
        
        let sS = Scroller(playbackScreen1: p1, playbackScreen2: p22, state: state)
        let cF = CrossFader(player1: musicPlayer, player2: contentPlayer)
        let mainScreen = MainScreen(scrollScreen: sS, crossFader: cF, musicPlayer: musicPlayer, contentPlayer: contentPlayer)
        
        self.remote = Remote(audioPlayer1: musicPlayer, audioPlayer2: contentPlayer)
        super.init(rootViewController: mainScreen)
        navigationBar.barStyle = .black
    }
    required init?(coder aDecoder: NSCoder) { fatalError("Ne Pas") }
}
