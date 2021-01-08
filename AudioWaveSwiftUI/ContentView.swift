//
//  ContentView.swift
//  AudioWave SwiftUI
//
//  Created by Jacob Christie on 2021-01-08.
//  Copyright © 2021 SphericalWave. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var appModel: AppModel
    
    var body: some View {
        Text("Hello, World!")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
