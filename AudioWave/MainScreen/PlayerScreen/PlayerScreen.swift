//
//  PlayerScreen.swift
//  AudioWave
//
//  Created by Aaron Anthony on 2020-01-20.
//  Copyright © 2020 SphericalWave. All rights reserved.
//

import UIKit

class PlayerScreen: UIViewController
{
    @IBOutlet weak var progressContainer: UIView!
    @IBOutlet weak var artworkContainer: UIView!
    @IBOutlet weak var buttonContainer: UIView!
    @IBOutlet weak var textContainer: UIView!
    let player: AudioPlayer
    let titles: Titles
    let progress: Progress
    let artwork: Artwork
    let buttons: Buttons
    
    convenience init(player: AudioPlayer) {
        let t2 = Titles()
        let p2 = Progress()
        let b2 = Buttons()
        guard let book = UIImage(systemName: "music.note") else { fatalError() }
        let a2 = Artwork(art: book)
        self.init(player: player, titles: t2, buttons: b2, progress: p2, artwork: a2)
    }

    init(player: AudioPlayer, titles: Titles, buttons: Buttons, progress: Progress, artwork: Artwork) {
        self.titles = titles
        self.progress = progress
        self.artwork = artwork
        self.buttons = buttons
        self.player = player
        super.init(nibName: "PlayerScreen", bundle: nil)
        view.backgroundColor = .white
        view.layer.cornerRadius = 10.0
        view.clipsToBounds = true
    }
    required init?(coder: NSCoder) { fatalError("Bad Monkey") }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        artworkContainer.backgroundColor = .clear
        self.embed(viewController: artwork, inContainerView: artworkContainer)
        self.embed(viewController: progress, inContainerView: progressContainer)
        self.embed(viewController: titles, inContainerView: textContainer)
        self.embed(viewController: buttons, inContainerView: buttonContainer)
    }
    
}
