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
        print(a.frame)
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
        //FIXME: Extension on UIImageView perhaps? Duplicated in itemCell, artwork, playlistCell
        let size = artwork.bounds.size
        guard let sizedArt = player.artwork()?.image(at: size) else {
            artwork.image = #imageLiteral(resourceName: "mediumNote")  //FIXME: Use SFSymbol
            return
        }
        artwork.image = sizedArt
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(artwork.frame)
        let frame = CGRect(x: 0, y: 0, width: 375, height: 375)
        artwork.frame = frame //view.bounds
        print(artwork.frame)
        artwork.backgroundColor = .green
        artwork.contentMode = .scaleAspectFit  //FIXME: Scale is misbehaving
        view.addSubview(artwork)
    }
}
