//
//  IdeaLoopButton.swift
//  AudioWave
//
//  Created by Aaron Anthony on 2017-07-20.
//  Copyright © 2017 SphericalWave. All rights reserved.
//

import UIKit

enum IdeaMode {
    case repeatOne
    case repeatAll
    case random
}

protocol LoopButtonDelegate: AnyObject { func update(mode: IdeaMode) }

class LoopButton: UIButton
{
    var mode: IdeaMode //FIXME: Mutable State
    weak var delegate: LoopButtonDelegate?
    
    required init?(coder: NSCoder) {
        self.mode = .repeatAll
        super.init(coder: coder)
        self.addTarget(self, action: #selector(nextState), for: .touchUpInside)
    }
    
    @objc func nextState() {
        switch mode {
        case .repeatAll:
            mode = .repeatOne
            self.setImage(#imageLiteral(resourceName: "Loop One"), for: .normal)
        case .repeatOne:
            mode = .random
            self.setImage(#imageLiteral(resourceName: "Loop All"), for: .normal)
        case .random:
            mode = .repeatAll
            self.setImage(#imageLiteral(resourceName: "Random"), for: .normal)
        }
        guard delegate != nil else { fatalError("Connect Delegate") }
        delegate?.update(mode: mode)
    }
}
