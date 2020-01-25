//
//  MusicPlaylists.swift
//  AudioWave
//
//  Created by Aaron Anthony on 2020-01-25.
//  Copyright © 2020 SphericalWave. All rights reserved.
//

import UIKit

class MusicPlaylists
{
    let audioLibrary: AudioLibrary
    
    init(audioLibrary: AudioLibrary) {
        self.audioLibrary = audioLibrary
    }
    
    func playlist(at index: Int) -> MusicPlaylist {
        //TODO: return audioLibrary.playlist(at index: index)
        return MusicPlaylist()
    }
    
    func count() -> Int {
        return 3
    }
}

class MusicPlaylist
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
