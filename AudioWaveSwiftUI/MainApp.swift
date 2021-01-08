//
//  MainApp.swift
//  AudioWave SwiftUI
//
//  Created by Jacob Christie on 2021-01-08.
//  Copyright © 2021 SphericalWave. All rights reserved.
//

import SwiftUI

@main
struct MainApp: App {
    @StateObject var appModel = AppModel()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(appModel)
        }
    }
}
