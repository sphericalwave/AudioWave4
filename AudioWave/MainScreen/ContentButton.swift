//
//  ContentButton.swift
//  AudioWave
//
//  Created by Aaron Anthony on 2020-02-25.
//  Copyright © 2020 SphericalWave. All rights reserved.
//

//import UIKit
//
//class ContentButton: SwModalButton
//{
//    convenience init?(parentScreen: UIViewController) {
//        let audioLibrary = AudioLibrary()           //FIXME: Inject
//        let mp = Playlists(audioLibrary: audioLibrary)
//        let playlistScreen = MusicPlaylistsScreen(musicPlaylists: mp)
//        self.init(destinationScreen: playlistScreen, parentScreen: parentScreen)
//    }
//    
//    init?(destinationScreen: UIViewController, parentScreen: UIViewController) {
//        guard let note = UIImage(systemName: "book") else { return nil }
//        super.init(image: note, destinationScreen: destinationScreen, parentScreen: parentScreen)
//    }
//    required init?(coder aDecoder: NSCoder) { fatalError("Don't") }
//}
