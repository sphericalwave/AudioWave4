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
    
    init(playerOneUI: AudioSourceUI, playerTwoUI: AudioSourceUI) {
        self.playbackScreen1 = playerOneUI
        self.playbackScreen2 = playerTwoUI
        let options = [UIPageViewController.OptionsKey.interPageSpacing : 20]
        super.init(transitionStyle: .scroll, navigationOrientation: .horizontal, options: options)
        self.setViewControllers([playerOneUI], direction: .forward, animated: true, completion: nil)
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
