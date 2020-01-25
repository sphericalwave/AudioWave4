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

    override func viewDidLoad() {
        super.viewDidLoad()
        crossFaderContainer.backgroundColor = .gray
        scrollPageContainer.backgroundColor = .black
        self.embed(viewController: crossFader, inContainerView: crossFaderContainer)
        self.embed(viewController: scrollScreen, inContainerView: scrollPageContainer)
        let audio = ContentButton(parentScreen: self)
        let music = MusicButton(parentScreen: self) //FIXME: Circular Ref?
        navigationItem.leftBarButtonItem = music
        navigationItem.rightBarButtonItem = audio
    }
}


