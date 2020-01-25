//
//  Playlist.swift
//  AudioWave
//
//  Created by Aaron Anthony on 2020-01-25.
//  Copyright © 2020 SphericalWave. All rights reserved.
//

import UIKit

class Playlist
{
    func name() -> String {
        return "GyroBlaster"
    }
    
    func track(at index: Int) -> Track {
        //TODO: return audioLibrary.playlist(at index: index)
        return Track()
    }
    
    func art() -> UIImage {
        return #imageLiteral(resourceName: "NoteSpace2")
    }
    
    func artist() -> String {
        return "SphericalWave"
    }
}

class Track
{
    func art() -> UIImage {
        return #imageLiteral(resourceName: "NoteSpace2")
    }
    
    func artist() -> String {
        return "SphericalWave"
    }
    
    func title() -> String {
        return "Gyroblaster"
    }
}
