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
    
    init(scrollScreen: Scroller, crossFader: CrossFader) {
        self.scrollScreen = scrollScreen
        self.crossFader = crossFader
        super.init(nibName: "MainScreen", bundle: nil)
        self.title = "AudioWave"
        edgesForExtendedLayout = [] //no content under nav bar
    }
    required init?(coder aDecoder: NSCoder) { fatalError() }

    //FIXME: Hidden Dependencies
    override func viewDidLoad() {
        super.viewDidLoad()
        crossFaderContainer.backgroundColor = .gray
        scrollPageContainer.backgroundColor = .black
        self.embed(viewController: crossFader, inContainerView: crossFaderContainer)
        self.embed(viewController: scrollScreen, inContainerView: scrollPageContainer)
        //let audio = ContentButton(parentScreen: self)   //FIXME: Circular Ref?
        
//        let audioPlayer = SWAudioPlayer(audioSession: <#T##AVAudioSession#>, commandCenter: <#T##MPRemoteCommandCenter#>, nowPlayingInfoCenter: <#T##MPNowPlayingInfoCenter#>, notificationCenter: <#T##NotificationCenter#>, isMusicPlayer: <#T##Bool#>)
//        let musicPlaylistsScreenData = MusicPlaylistsScreenData(musicPlaylists: <#T##[MPMediaPlaylist]#>)
//        let musicPlaylistsScreen = MusicPlaylistsScreen(data: musicPlaylistsScreenData, audioPlayer: audioPlayer)
//        
//        guard let note = UIImage(systemName: "music.note") else { fatalError() }
//        let musicPlaylistButton = SwModalButton(image: note, destinationScreen: musicPlaylistsScreen, parentScreen: self)
//        navigationItem.leftBarButtonItem = musicPlaylistButton
       // navigationItem.rightBarButtonItem = audio
    }
}
