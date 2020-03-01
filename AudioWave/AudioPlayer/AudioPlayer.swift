//
//  AudioPlayer.swift
//  AudioWave
//
//  Created by Aaron Anthony on 2020-02-25.
//  Copyright © 2020 SphericalWave. All rights reserved.
//

import UIKit
import MediaPlayer

protocol AudioPlayer: AnyObject
{
    func play()
    func pause()
    func next()
    func previous()
    func speed(_ speed: Float)
    func track() -> String
    func artist() -> String
    func album() -> String
    func playback(mode: PlayMode)
    func artwork() -> MPMediaItemArtwork?
    func elapsedTime() -> String
    func remainingTime() -> String
    func seekTo(percentage: Float)
    func percentage() -> Float
    func isPlaying() -> Bool
}




