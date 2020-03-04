//
//  MusicPlaylistButton.swift
//  AudioWave
//
//  Created by Aaron Anthony on 2020-01-25.
//  Copyright © 2020 SphericalWave. All rights reserved.
//

import UIKit

class PlaylistsButton: SwModalButton
{
    init(audioSource: AudioSource, audioLibrary: AudioLibrary, parent: UIViewController) {
        //FIXME: Refactor into Buttons
        let musicPlaylists = audioLibrary.playlists()
        guard let note = UIImage(systemName: "music.note.list") else { fatalError() }
        let musicPlaylistsScreenData = PlaylistsScreenData(musicPlaylists: musicPlaylists, musicPlayer: audioSource)
        let musicPlaylistsScreen = PlaylistsScreen(data: musicPlaylistsScreenData, audioPlayer: audioSource)
        super.init(image: note, destinationScreen: musicPlaylistsScreen, parentScreen: parent)
    }
    required init?(coder aDecoder: NSCoder) { fatalError("Don't") }
    
    @objc override func didTap(_ sender: Any) { //FIXME: sender is redundant
        //let nav = UINavigationController(rootViewController: destinationScreen)
        //parentScreen.present(nav, animated: true, completion: nil)
        super.didTap(sender)
    }
}
