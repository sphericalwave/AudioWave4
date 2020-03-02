//
//  MusicPlayer.swift
//  AudioWave
//
//  Created by Aaron Anthony on 2020-02-28.
//  Copyright © 2020 SphericalWave. All rights reserved.
//

import AVFoundation
import MediaPlayer

class MusicPlayer
{
    var state: AudioPlayerState //FIXME: Be Immutable
    var player: AVAudioPlayer?       //FIXME: Be Immutable / Hidden Dependency
    let notifications = NotificationCenter.default
    var playlist: Playlist? //FIXME: Be Immutable
    
    init(state: AudioPlayerState) {
        self.state = state
    }
    
    //MARK: - Cells
    func load(_ playlist: Playlist) {
        self.playlist = playlist
    }
    
    func load(_ mediaItem: MPMediaItem) {
        playlist?.play(mediaItem)    //FIXME: Don't Like This, Keeps Playlist State in Sync
        self.player = try! AVAudioPlayer(contentsOf: mediaItem.assetURL!)   //FIXME: Fragile
        player?.prepareToPlay()
        notifications.post(name: .didLoad, object: self)
    }
    
    //MARK: - Buttons
    func play() {
        player?.play()
        notifications.post(name: .didPlay, object: self)
    }
    
    func pause() {
        player?.pause()
        notifications.post(name: .didPause, object: self)
    }
    
    func next() {
        //FIXME: load the next one from the playlist
        //FIXME: play if previously playing
        notifications.post(name: .didSkip, object: self)
        fatalError()
    }
    
    func previous() {
        //FIXME: load the previous one from the playlist
        //FIXME: play if previously playing
        notifications.post(name: .didPrevious, object: self)
        fatalError()
    }
    
    func isPlaying() -> Bool { return player?.isPlaying ?? false }

    //MARK: - Secondary Buttons
    func speed(_ speed: Float) {
        //FIXME:
        fatalError()
    }
    
    func clock() {}
    func loop() {}
    
    //MARK: - Titles
    func track() -> String {
        //return mediaItem?.title ?? "No Track Name"
        return "FIXME"
    }
    
    func artist() -> String {
        //return mediaItem?.artist ?? "No Artist Name"
        return "FIXME"
    }
    
    func album() -> String { return "FIXME" }
    
    func playback(mode: PlayMode) { fatalError() }
    
    //MARK: - Artwork
    func artwork() -> MPMediaItemArtwork? {
        //return mediaItem?.artwork
        return nil
    }
    
    //MARK: - Progress
    func elapsedTime() -> String {
        guard var cT = player?.currentTime else { fatalError() }    //FIXME: Var
        return cT.readable()
    }
    
    func remainingTime() -> String {
        guard let cT = player?.currentTime else { fatalError() }
        guard let dur = player?.duration else { fatalError() }
        var remaining = (dur - cT)  //FIXME: Var
        return remaining.readable()
    }
    
    func seekTo(percentage: Float) {
        guard let dur = player?.duration else { fatalError() }
        let time = dur * Double(percentage)
        player?.currentTime = time
    }
    
    func percentage() -> Float {
        guard let cT = player?.currentTime else { fatalError() }
        guard let dur = player?.duration else { fatalError() }
        return Float( cT / dur )
    }
        
    //MARK: - Fader
    func volume(_ volume: Float) {
        if let player = player {
            player.isMeteringEnabled = true
            player.updateMeters()
            let left = player.averagePower(forChannel: 0)
            let right = player.averagePower(forChannel: 1)
            print("\(self)left: \(left) right: \(right)")
            player.volume = volume
        }
    }
}
