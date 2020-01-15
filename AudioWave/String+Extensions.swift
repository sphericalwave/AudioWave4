//
//  String+Extensions.swift
//  AudioWave2
//
//  Created by Aaron Anthony on 2017-06-19.
//  Copyright © 2017 SphericalWave. All rights reserved.
//

import Foundation
import MediaPlayer

extension String {
    
    init(track: MPMediaItem) {
        var string = ""
        if let artist = track.artist {
            string += artist
        }
        
        if let albumTitle = track.albumTitle {
            string += " - \(albumTitle)"
        }
        
        self = (!string.isEmpty) ? string : "This should never happen"
    }
}
