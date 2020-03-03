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

//protocol PlayButtonDelegate: AnyObject {
//    func update(mode: PlayMode)
//}

class PlayButton: UIButton
{
    var mode: PlayMode //FIXME: Mutable State
    //weak var delegate: PlayButtonDelegate?
    let pauseIcon: UIImage
    let playIcon: UIImage
    
    required init?(coder: NSCoder) {
        self.mode = .play

        guard let pause = UIImage(systemName: "pause") else { fatalError() } //FIXME: Fragile
        guard let play = UIImage(systemName: "play") else { fatalError() } //FIXME: Fragile
        self.pauseIcon = pause
        self.playIcon = play
        super.init(coder: coder)
        setImage(playIcon, for: .normal)
        //self.imageView?.contentMode = .scaleAspectFill //Scale Icons
        //self.addTarget(self, action: #selector(nextState), for: .touchUpInside)
    }
    
    func play() { setImage(playIcon, for: .normal) }
    
    func pause() {  setImage(pauseIcon, for: .normal) }
    
//    @objc func nextState() {
//        switch mode {
//        case .play:
//            mode = .pause
//            self.setImage(pauseIcon, for: .normal)
//        case .pause:
//            mode = .play
//            self.setImage(playIcon, for: .normal)
//        }
//    }
}
