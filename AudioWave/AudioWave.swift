//
//  AudioWave.swift
//  AudioWave
//
//  Created by Aaron Anthony on 2020-01-25.
//  Copyright © 2020 SphericalWave. All rights reserved.
//

import UIKit

final class AudioWave: UINavigationController {
    init(appModel: AppModel) {
        let p1 = AudioSourceUI(audioSource: appModel.audioSource1)
        let p22 = AudioSourceUI(audioSource: appModel.audioSource2)
        let state = AudioWaveState(
            musicPlayerState: appModel.audioSource1.state,
            audioPlayerState: appModel.audioSource1.state,
            crossFader: 0.5,
            activeScreen: 0
        )

        let sS = Scroller(playbackScreen1: p1, playbackScreen2: p22, state: state)
        let cF = CrossFader(player1: appModel.audioSource1, player2: appModel.audioSource2)
        let mainScreen = MainScreen(
            scrollScreen: sS,
            crossFader: cF,
            audioSource1: appModel.audioSource1,
            audioSource2: appModel.audioSource2
        )

        super.init(rootViewController: mainScreen)

        navigationBar.barStyle = .black
    }

    required init?(coder aDecoder: NSCoder) { fatalError("Ne Pas") }
}
