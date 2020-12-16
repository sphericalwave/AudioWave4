//
//  MasterScrollScreen.swift
//  AudioWave
//
//  Created by Aaron Anthony on 2020-01-14.
//  Copyright © 2020 SphericalWave. All rights reserved.
//

import UIKit

class Scroller: UIPageViewController
{
    let playbackScreen1: AudioSourceUI
    let playbackScreen2: AudioSourceUI
    let state: AudioWaveState
    
    
    init(playbackScreen1: AudioSourceUI, playbackScreen2: AudioSourceUI, state: AudioWaveState) {
        self.playbackScreen1 = playbackScreen1
        self.playbackScreen2 = playbackScreen2
        self.state = state
        let options = [UIPageViewController.OptionsKey.interPageSpacing : 20]
        super.init(transitionStyle: .scroll, navigationOrientation: .horizontal, options: options)
        self.setViewControllers([playbackScreen1], direction: .forward, animated: true, completion: nil)
        self.delegate = self
        self.dataSource = self
        self.view.isUserInteractionEnabled = true
    }
    required init?(coder: NSCoder) { fatalError("Never Called") }
}

extension Scroller: UIPageViewControllerDataSource
{
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard viewController == playbackScreen2 else { return nil }
        return playbackScreen1
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
       guard viewController == playbackScreen1 else { return nil }
        return playbackScreen2
    }
}

extension Scroller: UIPageViewControllerDelegate
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
