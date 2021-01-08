//
//  ContentView.swift
//  AudioWave SwiftUI
//
//  Created by Jacob Christie on 2021-01-08.
//  Copyright © 2021 SphericalWave. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var audioWave: AudioWave

    var body: some View {
        VStack {
            ScrollerView(audioWave: audioWave)
            CrossFader(value: $audioWave.currentFade)
                .padding()
                .frame(height: 100, alignment: .top)
                .background(Color.black)
        }
            .ignoresSafeArea(edges: .bottom)
            .navigationTitle("Audio Wave")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(AppModel())
    }
}

private struct ScrollerView: UIViewControllerRepresentable {
    let audioWave: AudioWave

    func makeUIViewController(context: Context) -> Scroller {
        let state = AudioWaveState(
            musicPlayerState: audioWave.musicSource.state,
            audioPlayerState: audioWave.bookSource.state,
            crossFader: 0.5,
            activeScreen: 0
        )

        return Scroller(
            playbackScreen1: AudioSourceUI(audioSource: audioWave.musicSource),
            playbackScreen2: AudioSourceUI(audioSource: audioWave.bookSource),
            state: state
        )
    }

    func updateUIViewController(_ uiViewController: Scroller, context: Context) {

    }
}
