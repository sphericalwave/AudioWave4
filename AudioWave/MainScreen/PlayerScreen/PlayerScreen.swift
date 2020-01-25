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
    let player: Player
    let titles: Titles
    let progress: Progress
    let artwork: Artwork
    let buttons: Buttons

    //FIXME: Inject Everything
    init() {
        let t = Titles()
        let p = Progress()
        let b = Buttons()
        let a = Artwork(art: #imageLiteral(resourceName: "NoteSpace"))
        let pl = Player(titles: t, buttons: b, progress: p, artwork: a)
        b.delegate = pl
        p.delegate = pl
       // t.delegate = pl
        self.titles = t
        self.progress = p
        self.artwork = a
        self.buttons = b
        self.player = pl
        super.init(nibName: "PlayerScreen", bundle: nil)
        self.view.backgroundColor = .gray
        artworkContainer.backgroundColor = .clear
        view.backgroundColor = .clear
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.embed(viewController: artwork, inContainerView: artworkContainer)
        self.embed(viewController: progress, inContainerView: progressContainer)
        self.embed(viewController: titles, inContainerView: textContainer)
        self.embed(viewController: buttons, inContainerView: buttonContainer)
    }
    
    required init?(coder: NSCoder) { fatalError() }
}
