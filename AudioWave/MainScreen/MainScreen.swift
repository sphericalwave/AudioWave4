//
//  MainScreen.swift
//  AudioWave
//
//  Created by Aaron Anthony on 2019-05-21.
//  Copyright © 2019 SphericalWave. All rights reserved.
//

import UIKit
import AVFoundation
import MediaPlayer


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
        let music = UIBarButtonItem(image: #imageLiteral(resourceName: "65-note"), style: .plain, target: nil, action: nil)
        let audio = UIBarButtonItem(image: #imageLiteral(resourceName: "mediumBook"), style: .plain, target: nil, action: nil)
        navigationItem.leftBarButtonItem = music
        navigationItem.rightBarButtonItem = audio

        //let musicBtn = SwModalButton(image: #imageLiteral(resourceName: "notePlaceholder"), destinationScreen: UIViewController(), parentScreen: self)
        //let booksButton = SwModalButton(image: #imageLiteral(resourceName: "notePlaceholder"), destinationScreen: UIViewController(), parentScreen: self)
        //self.navigationItem.rightBarButtonItem = musicBtn
        //self.navigationItem.leftBarButtonItem = booksButton
//        self.booksButton.isEnabled = true
//        self.musicButton.isEnabled = true
    }
}


