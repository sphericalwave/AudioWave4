//
//  MasterScrollScreen.swift
//  AudioWave
//
//  Created by Aaron Anthony on 2020-01-14.
//  Copyright © 2020 SphericalWave. All rights reserved.
//

import UIKit

class Players: UIPageViewController
{
    let playbackScreen1: UIViewController //PlaybackScreen
    let playbackScreen2: UIViewController //PlaybackScreen
    
    init(playbackScreen1: UIViewController, playbackScreen2: UIViewController) {
        self.playbackScreen1 = playbackScreen1
        self.playbackScreen2 = playbackScreen2
        super.init(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        self.setViewControllers([playbackScreen1], direction: .forward, animated: true, completion: nil)
        self.delegate = self
        self.dataSource = self
        self.view.isUserInteractionEnabled = true
    }
    
    required init?(coder: NSCoder) { fatalError("Never Called") }
}

extension Players: UIPageViewControllerDataSource
{
    //Content Player VC
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
       // guard viewController == musicPlayerVC else { return nil }
        return playbackScreen1
    }

    //MusicPlayer VC
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
       // guard viewController == audioBookPlayerVC else { return nil }
        return playbackScreen2
    }
}

extension Players: UIPageViewControllerDelegate
{
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {

        //pageControl.currentPage = (previousViewControllers[0] == audioBookPlayerVC) ? 1 : 0

        //TODO: Put This In a More Relevant Place?
        //        switch pageControl.currentPage {
        //        case 0:
        //            //self.booksButton.isEnabled = true
        //            //musicButton.isEnabled = false
        //        case 1:
        //
        //            //self.booksButton.isEnabled = false
        //            //musicButton.isEnabled = true
        //        default:
        //            fatalError()
        //        }
    }
}
