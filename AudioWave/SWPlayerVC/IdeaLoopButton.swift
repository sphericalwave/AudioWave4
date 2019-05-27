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

class IdeaLoopButton: UIButton {
    
    var loopMode: IdeaMode = .repeatAll {
        willSet {
            switch newValue {
            case .repeatOne:
                //self.image = #imageLiteral(resourceName: "Loop One")
                self.setImage(#imageLiteral(resourceName: "Loop One"), for: .normal)
            case .repeatAll:
                //self.image = #imageLiteral(resourceName: "Loop All")
                self.setImage(#imageLiteral(resourceName: "Loop All"), for: .normal)
            case .random:
                //self.image = #imageLiteral(resourceName: "Random")
                self.setImage(#imageLiteral(resourceName: "Random"), for: .normal)
                
            }
        }
    }
    
    func nextState() -> IdeaMode {
        switch loopMode {
        case .repeatAll:
            loopMode = .repeatOne
            return .repeatOne
        case .repeatOne:
            loopMode = .random
            return .random
        case .random:
            loopMode = .repeatAll
            return .repeatAll
        }
    }
    
    
}
