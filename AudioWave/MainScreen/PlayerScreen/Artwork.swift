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
    let artwork: UIImageView!
    let notifications = NotificationCenter.default  //FIXME: Hidden Dependency
    let player: AudioPlayer

    init(art: UIImage, player: AudioPlayer) {
        self.player = player
        let a = UIImageView()
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
        let size = artwork.bounds.size
        guard let sizedArt = player.artwork()?.image(at: size) else {
            artwork.image = #imageLiteral(resourceName: "mediumNote")  //FIXME: Use SFSymbol
            return
        }
        artwork.image = sizedArt
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        artwork.frame = view.frame
        artwork.backgroundColor = .green
        artwork.contentMode = .scaleAspectFit  //FIXME: Scale is misbehaving
        view.addSubview(artwork)
    }
}
