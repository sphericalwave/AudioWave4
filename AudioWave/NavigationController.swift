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
        let p1 = AudioSourceUI(audioSource: appModel.audioWave.musicSource)
        let p22 = AudioSourceUI(audioSource: appModel.audioWave.bookSource)

        let sS = Scroller(playbackScreen1: p1, playbackScreen2: p22, state: appModel.audioWave.state)
        let cF = CrossFader(audioWave: appModel.audioWave)
        let mainScreen = MainScreen(
            scrollScreen: sS,
            crossFader: cF,
            audioWave: appModel.audioWave
        )

        super.init(rootViewController: mainScreen)

        navigationBar.barStyle = .black
    }

    required init?(coder aDecoder: NSCoder) { fatalError("Ne Pas") }
}
