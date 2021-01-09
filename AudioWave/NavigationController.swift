//
//  NavigationController.swift
//  AudioWave
//
//  Created by Aaron Anthony on 2020-01-25.
//  Copyright © 2020 SphericalWave. All rights reserved.
//

import UIKit

final class NavigationController: UINavigationController {
    init(appModel: AppModel) {
        let playerUI1 = PlayerUI(audioSource: appModel.playlistCombo.musicSource) //FIXME: Encapsulation
        let playerUI2 = PlayerUI(audioSource: appModel.playlistCombo.bookSource)

        let scroller = Scroller(playbackScreen1: playerUI1, playbackScreen2: playerUI2, state: appModel.playlistCombo.state) //FIXME: Encapsulation
        let crossFader = CrossFader(audioWave: appModel.playlistCombo)
        let mainScreen = MainScreen(
            scrollScreen: scroller,
            crossFader: crossFader,
            playlistCombo: appModel.playlistCombo)

        super.init(rootViewController: mainScreen)

        navigationBar.barStyle = .black
    }

    required init?(coder aDecoder: NSCoder) { fatalError("Ne Pas") }
}
