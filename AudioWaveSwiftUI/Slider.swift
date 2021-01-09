//
//  Slider.swift
//  AudioWave SwiftUI
//
//  Created by Jacob Christie on 2021-01-08.
//  Copyright © 2021 SphericalWave. All rights reserved.
//

import SwiftUI

/// A Reimplementation of Slider that allows a custom thumb image
struct Slider<T: BinaryFloatingPoint>: View {
    @Binding var value: T
    let range: ClosedRange<T>

    private let thumbImage: UIImage?

    init(value: Binding<T>, range: ClosedRange<T> = 0...1) {
        self._value = value
        self.range = range
        self.thumbImage = nil
    }

    var body: some View {
        Representable(value: $value, range: range)
            .environment(\.sliderThumbImage, thumbImage)
    }
}

extension Slider {
    private init(value: Binding<T>, range: ClosedRange<T> = 0...1, thumbImage: UIImage? = nil) {
        self._value = value
        self.range = range
        self.thumbImage = thumbImage
    }

    func thumbImage(_ image: UIImage?) -> Slider {
        Slider(value: $value, range: range, thumbImage: image)
    }
}

extension Slider {
    struct Representable<T: BinaryFloatingPoint>: UIViewRepresentable {
        @Environment(\.sliderThumbImage) var thumbImage

        @Binding var value: T
        let range: ClosedRange<T>

        func makeUIView(context: Context) -> UISlider {
            let action = UIAction { action in
                let slider = action.sender as! UISlider
                value = T(slider.value)
            }
            let slider = UISlider(frame: .init(), primaryAction: action)
            slider.minimumValue = Float(range.lowerBound)
            slider.maximumValue = Float(range.upperBound)
            slider.setThumbImage(thumbImage, for: .normal)
            return slider
        }

        func updateUIView(_ slider: UISlider, context: Context) {
            slider.value = Float(value)
            slider.setThumbImage(thumbImage, for: .normal)

        }
    }
}

private struct SliderThumbImageEnvironmentKey: EnvironmentKey {
    static let defaultValue: UIImage? = nil
}

extension EnvironmentValues {
    var sliderThumbImage: UIImage? {
        get { self[SliderThumbImageEnvironmentKey.self] }
        set { self[SliderThumbImageEnvironmentKey.self] = newValue }
    }
}

struct Slider_Previews: PreviewProvider {
    static var previews: some View {
        Slider(value: .constant(0.5))
            .thumbImage(UIImage(named: "Fader3"))
            .previewLayout(.sizeThatFits)
    }
}
