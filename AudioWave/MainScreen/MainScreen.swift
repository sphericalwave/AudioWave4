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
    let audioSource1: AudioSource
    let audioSource2: AudioSource
    var mediaPermission: MediaPermission?   //FIXME: Nil
    
    //FIXME: Shouldn't need to inject AudioSources
    init(
        scrollScreen: Scroller,
        crossFader: CrossFader,
        audioSource1: AudioSource,
        audioSource2: AudioSource
    ) {
        self.scrollScreen = scrollScreen
        self.crossFader = crossFader
        self.audioSource1 = audioSource1
        self.audioSource2 = audioSource2
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
        self.mediaPermission = MediaPermission(audioSource1: audioSource1, audioSource2: audioSource2, parent: self)  //FIXME: Refference Cycle!
        mediaPermission?.requestLibraryPermissions()    //FIXME: Refference Cycle!
    }
}


