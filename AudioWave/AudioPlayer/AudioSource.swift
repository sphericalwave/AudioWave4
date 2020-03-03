//
//  MusicPlayer.swift
//  AudioWave
//
//  Created by Aaron Anthony on 2020-02-28.
//  Copyright © 2020 SphericalWave. All rights reserved.
//

import AVFoundation
import MediaPlayer

class AudioSource: NSObject
{
    var state: AudioPlayerState //FIXME: Be Immutable
    var player: AVAudioPlayer?       //FIXME: Be Immutable / Hidden Dependency
    let notifications = NotificationCenter.default
    var playlist: Playlist? //FIXME: Be Immutable
    
    init(state: AudioPlayerState) {
        self.state = state
        super.init()
    }
    
    //MARK: - Cells
    func load(_ playlist: Playlist) {
        self.playlist = playlist
    }
    
    func load(_ mediaItem: MPMediaItem) {
        playlist?.play(mediaItem)    //FIXME: Don't Like This, Keeps Playlist State in Sync
        guard let url = mediaItem.assetURL else { fatalError() }
        self.player = try! AVAudioPlayer(contentsOf: url)   //FIXME: Fragile
        player?.delegate = self
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
    
    func next() {   //FIXME: Repetition
        guard let item = playlist?.next() else { fatalError("playlist should loop") }
        load(item)
        play()
        notifications.post(name: .didSkip, object: self)
    }
    
    func previous() {   //FIXME: Repetition
        guard let item = playlist?.previous() else { fatalError("playlist should loop") }
        load(item)
        play()
        notifications.post(name: .didPrevious, object: self)
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
        guard let mediaItem = playlist?.currentItem() else { return "FIXME track()" }
        return mediaItem.title ?? "FIXME track() 2"
    }
    
    func artist() -> String {
        //return mediaItem?.artist ?? "No Artist Name"
        guard let mediaItem = playlist?.currentItem() else { return "FIXME artist()" }
        return mediaItem.artist ?? "FIXME artist() 2"
    }
    
    func album() -> String { return "FIXME" }
    
    func playback(mode: PlayMode) { fatalError() }
    
    //MARK: - Artwork
    func artwork() -> MPMediaItemArtwork? {
        guard let artwork = playlist?.currentItem().artwork else {
            return nil
        }
        return artwork
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

extension AudioSource: AVAudioPlayerDelegate
{
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        guard let item = playlist?.next() else { fatalError("playlist should loop") }   //FIXME: Repetition
        load(item)
        play()
    }
}
