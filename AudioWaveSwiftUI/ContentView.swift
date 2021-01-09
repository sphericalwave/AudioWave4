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
        container
    }

    private var container: some View {
        NavigationView {
            content
                .navigationBarTitleDisplayMode(.inline)
        }
    }

    private var content: some View {
        VStack {
            ScrollerView(audioWave: audioWave)
            CrossFader(value: $audioWave.currentFade)
                .padding()
                .frame(height: 100, alignment: .top)
        }
        .ignoresSafeArea(edges: .bottom)
        .navigationTitle("Audio Wave")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(AppModel())
            .colorScheme(.dark)
    }
}

private struct ScrollerView: UIViewControllerRepresentable {
    @Environment(\.colorScheme) var colorScheme
    let audioWave: AudioWave

    func makeUIViewController(context: Context) -> Scroller {
        let state = AudioWaveState(
            musicPlayerState: audioWave.musicSource.state,
            audioPlayerState: audioWave.bookSource.state,
            crossFader: 0.5,
            activeScreen: 0
        )

        let scroller = Scroller(
            playbackScreen1: AudioSourceUI(audioSource: audioWave.musicSource),
            playbackScreen2: AudioSourceUI(audioSource: audioWave.bookSource),
            state: state
        )
        scroller.overrideUserInterfaceStyle = .init(colorScheme)
        return scroller
    }

    func updateUIViewController(_ scroller: Scroller, context: Context) {
        scroller.overrideUserInterfaceStyle = .init(colorScheme)
    }
}
