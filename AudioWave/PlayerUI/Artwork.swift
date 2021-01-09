//
//  Artwork.swift
//  AudioWave
//
//  Created by Aaron Anthony on 2020-01-14.
//  Copyright © 2020 SphericalWave. All rights reserved.
//

import UIKit

//FIXME: SwiftUI
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
        artwork.contentMode = .scaleAspectFit
        notifications.addObserver(self, selector: #selector(playerDidLoad), name: .didLoad, object: player)
    }
    required init?(coder: NSCoder) { fatalError() }
    
    @objc func playerDidLoad(notification: Notification) {
        guard let art = player.artwork else {
            guard let playCircle = UIImage(systemName: "play.circle") else { fatalError() }
            artwork.image = playCircle
            return
        }
        artwork.refresh(with: art)
//        print("\nArtwork: playerDidLoad")
//        print("Artwork.view bounds: \(view.bounds) frame: \(view.frame)")
//        print("Artwork.artwork bounds: \(artwork.bounds) frame: \(artwork.frame)\n")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        print("\nArtwork: viewDidLoad")
//        print("Artwork.artwork bounds: \(artwork.bounds) frame: \(artwork.frame)\n")
        view.addSubview(artwork)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(false)
//        print("\nArtwork: viewDidAppear")
//        print("Artwork.view bounds: \(view.bounds) frame: \(view.frame)")
//        print("Artwork.artwork bounds: \(artwork.bounds) frame: \(artwork.frame)\n")
        artwork.frame = view.bounds
    }
}
