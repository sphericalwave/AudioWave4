//
//  CrossFader.swift
//  AudioWave SwiftUI
//
//  Created by Jacob Christie on 2021-01-08.
//  Copyright © 2021 SphericalWave. All rights reserved.
//

import SwiftUI

struct CrossFader: View {
    @Binding var value: Float

    var body: some View {
        HStack {
            Image("volume_meter")
                .resizable()
                .frame(width: 18, height: 24)

            Slider(value: $value)
                .thumbImage(UIImage(named: "Fader3"))

            Image("volume_meter")
                .resizable()
                .frame(width: 18, height: 24)
        }
    }
}

struct XFader_Previews: PreviewProvider {
    static var previews: some View {
        CrossFader(value: .constant(0.3))
            .previewLayout(.sizeThatFits)
    }
}
