//
//  Player.swift
//  AudioWave
//
//  Created by Aaron Anthony on 2020-01-22.
//  Copyright © 2020 SphericalWave. All rights reserved.
//

import AVFoundation
import UIKit

class Player
{
    //let playlist: String = "How do i make immutable?"
    let titles: Titles
    let buttons: Buttons
    let progress: Progress
    let artwork: Artwork
    
    init(titles: Titles, buttons: Buttons, progress: Progress, artwork: Artwork) {
        self.titles = titles
        self.buttons = buttons
        self.progress = progress
        self.artwork = artwork
    }
}

extension Player: ButtonDelegate
{
    func play() {
        print("\nfunc play()")
        print("launch timer to update progress")
        print("player.play\n")
        //toggle button symbol
        //buttons.play or pause
        //titles.update(title: "AudioWave", description: "is Back!")
    }
    
    func pause() {
        print("\nfunc pause()")
        print("kill timer to update progress")
        print("player.pause\n")
    }
    
    func next() {
        print("\nfunc next()")
        print("artwork.update(art: #imageLiteral(resourceName: cymatics-6")
        print("advance playlist")
        print("if playing start play\n")
        artwork.update(art: #imageLiteral(resourceName: "Book Placeholder"))
    }
    
    func previous() {
        print("\nfunc previous()")
        print("artwork.update(art: #imageLiteral(resourceName: cymatics-6")
        print("//advance playlist")
        print("//if playing start play\n")
        artwork.update(art: #imageLiteral(resourceName: "cymatics-6"))
    }
    func loop() {
        print ("\n//something to do with playlist\n")
    }
    func speed(rate: Float) {
        print("\n//player.rate = rate\n")
    }
}

extension Player: ProgressDelegate
{
    func seekTo(percent: Float) {
        print("player.seekTo(Double(self.slider.value))")
    }
    
    func update() -> (percent: Float, remain: Float, elapsed: Float) {
        print("func ProgressDelegate :: update(percent: Float, remain: TimeInterval, elapsed: TimeInterval)\n")
        //        if let currentTime = self.player.currentTime, let duration = self.player.duration {
        //            self.elapsedTimeLabel.text = self.humanReadableTimeInterval(currentTime)
        //            self.remainingTimeLabel.text = "-" + self.humanReadableTimeInterval(duration - currentTime)
        return (0.9, 9, 999)
    }
}

//extension Player: TitleDelegate
//{
//    func update() ->(title: String, description: String) {
//        return ("AudioWave", "is Rocking")
//    }
//}

//SWPlayer Decorated
//    init?(url: URL, rate: Float, volume: Float, time: TimeInterval) {
//        do { try super.init(contentsOf: url) }
//        catch { return nil }
//        self.enableRate = true
//        self.rate = rate
//        self.volume = volume
//        self.currentTime = time
//    }
//
//extension Player: AVAudioPlayerDelegate
//{
//    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
//        //play z next song
//    }
//}



