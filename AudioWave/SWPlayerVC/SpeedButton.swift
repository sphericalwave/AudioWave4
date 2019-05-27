//
//  SpeedButton.swift
//  AudioWave
//
//  Created by Aaron Anthony on 2017-08-30.
//  Copyright © 2017 SphericalWave. All rights reserved.
//

import UIKit

enum SWSpeed {
    case normal
    case twentyFivePercentFaster
    case fiftyPercentFaster
    case seventyFivePercentFaster
    case hundredPercentFaster
}

class SpeedButton: UIButton {
    
    var speed: SWSpeed = .normal {
        willSet {
            switch newValue {
            case .normal:
                self.setTitle("1x", for: .normal)
            case .twentyFivePercentFaster:
                self.setTitle("1.25x", for: .normal)
            case .fiftyPercentFaster:
                self.setTitle("1.5x", for: .normal)
            case .seventyFivePercentFaster:
                self.setTitle("1.75x", for: .normal)
            case .hundredPercentFaster:
                self.setTitle("2x", for: .normal)
            }
        }
    }
    
    func nextState() {
        switch speed {
        case .normal:
            speed = .twentyFivePercentFaster
        case .twentyFivePercentFaster:
            speed = .fiftyPercentFaster
        case .fiftyPercentFaster:
            speed = .seventyFivePercentFaster
        case .seventyFivePercentFaster:
            speed = .hundredPercentFaster
        case .hundredPercentFaster:
            speed = .normal
        }
    }
}
