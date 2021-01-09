//
//  MainScreen.swift
//  AudioWave
//
//  Created by Aaron Anthony on 2019-05-21.
//  Copyright © 2019 SphericalWave. All rights reserved.
//

import UIKit
import MediaPlayer

class MainScreen: UIViewController
{
    @IBOutlet weak var crossFaderContainer: UIView!
    @IBOutlet weak var scrollPageContainer: UIView!
    let scrollScreen: Scroller
    let crossFader: CrossFader
    let playlistCombo: PlaylistCombo
    var mediaPermission: MediaPermission?   //FIXME: Nil
    
    //FIXME: Shouldn't need to inject AudioSources
    init(
        scrollScreen: Scroller,
        crossFader: CrossFader,
        playlistCombo: PlaylistCombo
    ) {
        self.scrollScreen = scrollScreen
        self.crossFader = crossFader
        self.playlistCombo = playlistCombo
        super.init(nibName: "MainScreen", bundle: nil)
        self.title = "AudioWave"
        edgesForExtendedLayout = [] //no content under nav bar
    }
    required init?(coder aDecoder: NSCoder) { fatalError() }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        crossFaderContainer.backgroundColor = .gray
        scrollPageContainer.backgroundColor = .black
        self.embed(viewController: crossFader, inContainerView: crossFaderContainer)
        self.embed(viewController: scrollScreen, inContainerView: scrollPageContainer)
        self.mediaPermission = MediaPermission(
            audioSource1: playlistCombo.musicSource,
            audioSource2: playlistCombo.bookSource,
            parent: self
        )  //FIXME: Refference Cycle!
        mediaPermission?.requestLibraryPermissions()    //FIXME: Refference Cycle!
    }
}


