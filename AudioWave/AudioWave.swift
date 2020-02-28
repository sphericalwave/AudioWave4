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
    init() {
        let mPS = AudioPlayerState(playlistID: 600, trackID: 600, rate: 1.0, volume: 1.0)   //FIXME: IDs are wrong
        let aPS = AudioPlayerState(playlistID: 600, trackID: 600, rate: 1.0, volume: 1.0)   //FIXME: IDs are wrong
        let state = AudioWaveState(musicPlayerState: mPS, audioPlayerState: aPS, crossFader: 0.5, activeScreen: 0)
        
        //TODO: Convienience Init
        let t = Titles()
        let p = Progress()
        let b = Buttons()
        guard let note = UIImage(systemName: "music.note") else { fatalError() }
        let a = Artwork(art: note)
        let musicPlayer = MusicPlayer(state: mPS)
        let p1 = PlayerScreen(player: musicPlayer, titles: t, buttons: b, progress: p, artwork: a)
        
        //TODO: Convienience Init
        let t2 = Titles()
        let p2 = Progress()
        let b2 = Buttons()
        guard let book = UIImage(systemName: "book") else { fatalError() }
        let a2 = Artwork(art: book)
        let contentPlayer = ContentPlayer(state: aPS)
        let p22 = PlayerScreen(player: contentPlayer, titles: t2, buttons: b2, progress: p2, artwork: a2)
        
        let sS = Scroller(playbackScreen1: p1, playbackScreen2: p22, state: state)
        let cF = CrossFader(player1: musicPlayer, player2: contentPlayer)
        let mainScreen = MainScreen(scrollScreen: sS, crossFader: cF, musicPlayer: musicPlayer, contentPlayer: contentPlayer)
        
        super.init(rootViewController: mainScreen)
        navigationBar.barStyle = .black
    }
    required init?(coder aDecoder: NSCoder) { fatalError("Ne Pas") }
}
