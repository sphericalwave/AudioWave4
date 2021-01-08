//
//  AudioWave.swift
//  AudioWave SwiftUI
//
//  Created by Jacob Christie on 2021-01-08.
//  Copyright © 2021 SphericalWave. All rights reserved.
//

import Combine

final class AudioWave: ObservableObject {
    let musicSource: AudioSource
    let bookSource: AudioSource

    lazy var state = AudioWaveState(
        musicPlayerState: musicSource.state,
        audioPlayerState: bookSource.state,
        crossFader: 0.5,
        activeScreen: 0
    )

    @Published var currentFade: Float = 0

    private var subscribers: Set<AnyCancellable> = []

    init(musicSource: AudioSource, bookSource: AudioSource) {
        self.musicSource = musicSource
        self.bookSource = bookSource

        // Whenever `currentFade` is updated, this will call the method to configure the appropriate volume
        $currentFade
            .sink(receiveValue: fade(position:))
            .store(in: &subscribers)
    }
}

// MARK: - Cross Fading

extension AudioWave {
    enum FadeStrategy {
        case phi, log
    }

    private func fade(position: Float) {
        fade(position: position, strategy: .phi)
    }

    private func fade(position: Float, strategy: FadeStrategy) {
        switch strategy {
        case .phi: phiFade(position: position)
        case .log: logFade(position: position)
        }
    }

    private func phiFade(position: Float) {
        let vol1: Float
        let vol2: Float

        if position < 0.5 {
            vol1 = 2 * position
            vol2 = 1
        } else {
            vol1 = 1
            vol2 = -2 * position + 2
        }

        musicSource.volume(vol2)   //FIXME: These are swapped the wrong way as written but actually correct
        bookSource.volume(vol1)
    }

    private func logFade(position: Float) {
        //Log Cross Fader
        //let rightPlayerVolume = (0.5 * (0.9 + s) ).squareRoot()  //Not Necessarily Ideal
        //let leftPlayerVolume = (0.5 * (1 - s) ).squareRoot()

//        if s < -0.0414 {
//            leftPlayerVolume = 1
//            rightPlayerVolume = 0.707 + 0.707 * s
//        }
//        if s > -0.0414, s < 0.0414 {
//            leftPlayerVolume = 0.707 - 0.707 * s
//            rightPlayerVolume = 0.707 + 0.707 * s
//        }
//        if s > 0.0414 {
//            leftPlayerVolume = 0.707 - 0.707 * s
//            rightPlayerVolume = 1
//        }
    }
}
