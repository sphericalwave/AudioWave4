//
//  MusicPlaylistButton.swift
//  AudioWave
//
//  Created by Aaron Anthony on 2020-01-25.
//  Copyright © 2020 SphericalWave. All rights reserved.
//

import UIKit

class MusicButton: SwModalButton
{
    convenience init?(parentScreen: UIViewController) {
        //FIXME: Inject
        let audioLibrary = AudioLibrary()
        let mp = MusicPlaylists(audioLibrary: audioLibrary)
        let playlistScreen = MusicPlaylistScreen(musicPlaylists: mp)
        self.init(destinationScreen: playlistScreen, parentScreen: parentScreen)
    }
    
    init?(destinationScreen: UIViewController, parentScreen: UIViewController) {
        guard let note = UIImage(systemName: "music.note") else { return nil }
        super.init(image: note, destinationScreen: destinationScreen, parentScreen: parentScreen)
    }

    required init?(coder aDecoder: NSCoder) { fatalError() }
}
