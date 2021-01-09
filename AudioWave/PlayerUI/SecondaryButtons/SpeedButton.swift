//
//  SpeedButton.swift
//  AudioWave
//
//  Created by Aaron Anthony on 2017-08-30.
//  Copyright © 2017 SphericalWave. All rights reserved.
//

import UIKit

//TODO: Fix Naming
enum SWSpeed: Float {
    case normal = 1.0
    case twentyFivePercentFaster = 1.25
    case fiftyPercentFaster = 1.5
    case seventyFivePercentFaster = 1.75
    case hundredPercentFaster = 2.0
}

protocol SpeedButtonDelegate: AnyObject {
    func update(speed: Float)
}

class SpeedButton: UIButton
{
    var speed: SWSpeed //FIXME: Mutable State
    weak var delegate: SpeedButtonDelegate?
    
    required init?(coder: NSCoder) {
        self.speed = .normal
        super.init(coder: coder)
        self.addTarget(self, action: #selector(nextState), for: .touchUpInside)
        //self.setTitle("1x", for: .normal)
    }
    
    @objc func nextState() {
        switch speed {
        case .normal:
            speed = .twentyFivePercentFaster
            self.setTitle("1.25x", for: .normal)
        case .twentyFivePercentFaster:
            speed = .fiftyPercentFaster
            self.setTitle("1.5x", for: .normal)
        case .fiftyPercentFaster:
            speed = .seventyFivePercentFaster
            self.setTitle("1.75x", for: .normal)
        case .seventyFivePercentFaster:
            speed = .hundredPercentFaster
            self.setTitle("2x", for: .normal)
        case .hundredPercentFaster:
            speed = .normal
            self.setTitle("1x", for: .normal)
        }
        delegate?.update(speed: speed.rawValue)
    }
}
