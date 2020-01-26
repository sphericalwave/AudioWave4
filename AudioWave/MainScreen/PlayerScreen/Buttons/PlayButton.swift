//
//  PlayButton.swift
//  AudioWave
//
//  Created by Aaron Anthony on 2020-01-26.
//  Copyright © 2020 SphericalWave. All rights reserved.
//

import UIKit

enum PlayMode {
    case play
    case pause
}

protocol PlayButtonDelegate: AnyObject {
    func update(mode: PlayMode)
}

class PlayButton: UIButton
{
    var mode: PlayMode //FIXME: Mutable State
    weak var delegate: PlayButtonDelegate?
    
    required init?(coder: NSCoder) {
        self.mode = .play
        super.init(coder: coder)
        self.addTarget(self, action: #selector(nextState), for: .touchUpInside)
    }
    
    @objc func nextState() {
        switch mode {
        case .play:
            mode = .pause
            guard let pause = UIImage(systemName: "pause.fill") else { fatalError() } //FIXME: Fragile
            self.setImage(pause, for: .normal)
        case .pause:
            mode = .play
            guard let play = UIImage(systemName: "play.fill") else { fatalError() } //FIXME: Fragile
            self.setImage(play, for: .normal)
        }
        guard delegate != nil else { fatalError("Connect Delegate") }
        delegate?.update(mode: mode)
    }
}
