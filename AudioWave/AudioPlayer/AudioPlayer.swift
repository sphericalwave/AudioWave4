//
//  AudioPlayer.swift
//  AudioWave
//
//  Created by Aaron Anthony on 2020-02-25.
//  Copyright © 2020 SphericalWave. All rights reserved.
//

import Foundation


protocol AudioPlayer: AnyObject
{
    func play()
    func pause()
    func next()
    func previous()
}




