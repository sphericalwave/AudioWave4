//
//  Artwork.swift
//  AudioWave
//
//  Created by Aaron Anthony on 2020-01-14.
//  Copyright © 2020 SphericalWave. All rights reserved.
//

import UIKit

class Artwork: UIViewController
{
    let artwork: UIImageView
    let notifications = NotificationCenter.default  //FIXME: Hidden Dependency
    let player: AudioSource

    init(art: UIImage, player: AudioSource) {
        self.player = player
        let a = UIImageView(frame: .zero)
        a.image = art
        self.artwork = a
        super.init(nibName: nil, bundle: nil)
        view.backgroundColor = .blue
        view.layer.cornerRadius = 10.0
        view.clipsToBounds = true
        artwork.layer.cornerRadius = 10.0
        artwork.clipsToBounds = true
        notifications.addObserver(self, selector: #selector(playerDidLoad), name: .didLoad, object: player)
    }
    required init?(coder: NSCoder) { fatalError() }
    
    @objc func playerDidLoad(notification: Notification) {
        guard let art = player.artwork() else {
            artwork.image = #imageLiteral(resourceName: "mediumNote")  //FIXME: Use SFSymbol
            return
        }
        artwork.refresh(with: art)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //print(artwork.frame)
        let frame = CGRect(x: 0, y: 0, width: 375, height: 375)  //FIXME: SwiftUI removes autolayout issues
        artwork.frame = frame
        //print(artwork.frame)
        artwork.backgroundColor = .green
        artwork.contentMode = .scaleAspectFit
        view.addSubview(artwork)
    }
}
