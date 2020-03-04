//
//  MainScreen.swift
//  AudioWave
//
//  Created by Aaron Anthony on 2019-05-21.
//  Copyright © 2019 SphericalWave. All rights reserved.
//

import UIKit

class MainScreen: UIViewController
{
    @IBOutlet weak var crossFaderContainer: UIView!
    @IBOutlet weak var scrollPageContainer: UIView!
    let scrollScreen: Scroller
    let crossFader: CrossFader
    let musicPlayer: AudioSource
    let contentPlayer: AudioSource
    
    init(scrollScreen: Scroller, crossFader: CrossFader, musicPlayer: AudioSource, contentPlayer: AudioSource, audioLibrary: AudioLibrary) {
        self.scrollScreen = scrollScreen
        self.crossFader = crossFader
        self.musicPlayer = musicPlayer
        self.contentPlayer = contentPlayer
        super.init(nibName: "MainScreen", bundle: nil)
        self.title = "AudioWave"
        edgesForExtendedLayout = [] //no content under nav bar
        
        //FIXME: Refactor into Buttons
        let musicPlaylists = audioLibrary.playlists()
        guard let note = UIImage(systemName: "music.note.list") else { fatalError() }
        let musicPlaylistsScreenData = PlaylistsScreenData(musicPlaylists: musicPlaylists, musicPlayer: musicPlayer)
        let musicPlaylistsScreen = PlaylistsScreen(data: musicPlaylistsScreenData, audioPlayer: musicPlayer)
        let musicPlaylistsButton = SwModalButton(image: note, destinationScreen: musicPlaylistsScreen, parentScreen: self)
        navigationItem.leftBarButtonItem = musicPlaylistsButton
        
        //FIXME: Refactor into Buttons
        guard let book = UIImage(systemName: "book") else { fatalError() }
        let contentPlaylistsScreenData = PlaylistsScreenData(musicPlaylists: musicPlaylists, musicPlayer: contentPlayer)
        let contentPlaylistsScreen = PlaylistsScreen(data: contentPlaylistsScreenData, audioPlayer: contentPlayer)
        let contentPlaylistsButton = SwModalButton(image: book, destinationScreen: contentPlaylistsScreen, parentScreen: self)
        navigationItem.rightBarButtonItem = contentPlaylistsButton
    }
    required init?(coder aDecoder: NSCoder) { fatalError() }

    override func viewDidLoad() {
        super.viewDidLoad()
        crossFaderContainer.backgroundColor = .gray
        scrollPageContainer.backgroundColor = .black
        self.embed(viewController: crossFader, inContainerView: crossFaderContainer)
        self.embed(viewController: scrollScreen, inContainerView: scrollPageContainer)
    }
}
