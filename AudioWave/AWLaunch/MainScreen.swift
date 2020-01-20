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
    let scrollScreen: Players
    let crossFader: CrossFader
    
    init(scrollScreen: Players, crossFader: CrossFader) {
        self.scrollScreen = scrollScreen
        self.crossFader = crossFader
        super.init(nibName: "MainScreen", bundle: nil)
        self.title = "AudioWave"
    }

    required init?(coder aDecoder: NSCoder) { fatalError() }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.embed(viewController: crossFader, inContainerView: crossFaderContainer)
        self.embed(viewController: scrollScreen, inContainerView: scrollPageContainer)
//        self.booksButton.isEnabled = true
//        self.musicButton.isEnabled = true
    }
    

    
    //MARK: - Nav Buttons
    #warning("fix me")
    @IBAction func repeaterButton(_ sender: Any) {
//        self.pageViewController.setViewControllers([audioBookPlayerVC], direction: .forward, animated: true, completion: nil)
//        let when = DispatchTime.now() + 0.3 // change 2 to desired number of seconds
//        DispatchQueue.main.asyncAfter(deadline: when) {
//            self.audioBookPlayerVC.presentAudiobooksVC()
//        }
//
//
    }
    
    #warning("fix me...move into BarButon subclass")
    @IBAction func soundtrackButton(_ sender: Any) {
//        self.pageViewController.setViewControllers([musicPlayerVC], direction: .forward, animated: true, completion: nil)
//        let when = DispatchTime.now() + 0.3 // change 2 to desired number of seconds
//        DispatchQueue.main.asyncAfter(deadline: when) {
//            self.musicPlayerVC.presentMusicPlaylistVC()
//        }
//
    }
    
    //MARK: - Page Control
    private func configurePageControl() {
        //self.pageControl.currentPage = 0
        //self.pageControl.numberOfPages = 2
        //self.pageControl.currentPageIndicatorTintColor = .black
        //self.pageControl.pageIndicatorTintColor = .lightGray
    }
}


