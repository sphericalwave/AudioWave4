//
//  CommandCenter.swift
//  AudioWave
//
//  Created by Aaron Anthony on 2020-01-15.
//  Copyright © 2020 SphericalWave. All rights reserved.
//

import MediaPlayer

class NowPlaying
{
    let musicPlayer: Player
    let audioPlayer: Player
    
    init(musicPlayer: Player, audioPlayer: Player)
    {
        self.musicPlayer = musicPlayer
        self.audioPlayer = audioPlayer
        
        let commandCenter = MPRemoteCommandCenter.shared()
        commandCenter.playCommand.addTarget (handler: { [weak self] event -> MPRemoteCommandHandlerStatus in
            self?.musicPlayer.play()
            self?.audioPlayer.play()
            return .success
        })
        
        commandCenter.pauseCommand.addTarget (handler: { [weak self] event -> MPRemoteCommandHandlerStatus in
            self?.musicPlayer.pause()
            self?.audioPlayer.pause()
            return .success
        })
    }
    
    func play() { musicPlayer.play() }
    
    func pause() { musicPlayer.pause() }
}

//Construct playback screen and embed it in a navController
//        let audioSession = AVAudioSession()
//        let commandCenter = MPRemoteCommandCenter()
//        let nowPlayingInfoCenter = MPNowPlayingInfoCenter()
//        let notificationCenter = NotificationCenter()
