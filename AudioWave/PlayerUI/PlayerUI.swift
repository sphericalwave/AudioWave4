//
//  PlayerScreen.swift
//  AudioWave
//
//  Created by Aaron Anthony on 2020-01-20.
//  Copyright © 2020 SphericalWave. All rights reserved.
//

import UIKit

class PlayerUI: UIViewController
{
    @IBOutlet weak var progressContainer: UIView!
    @IBOutlet weak var artworkContainer: UIView!
    @IBOutlet weak var buttonContainer: UIView!
    @IBOutlet weak var secondaryButtonContainer: UIView!
    @IBOutlet weak var textContainer: UIView!
    let audioSource: AudioSource //FIXME: Naming
    let titles: Titles
    let progress: Progress
    let artwork: Artwork
    let buttons: Buttons
    let secondaryButtons: SecondaryButtons
    
    convenience init(audioSource: AudioSource) {
        let t2 = Titles(audioSource: audioSource)
        let p2 = Progress(audioSource: audioSource)
        let b2 = Buttons(audioSource: audioSource)
        let secondaryBtns = SecondaryButtons(audioSource: audioSource)
        guard let book = UIImage(systemName: "command") else { fatalError() }
        let a2 = Artwork(art: book, player: audioSource)
        self.init(audioSource: audioSource, titles: t2, buttons: b2, progress: p2, artwork: a2, secondaryButtons: secondaryBtns)
    }

    init(audioSource: AudioSource, titles: Titles, buttons: Buttons, progress: Progress, artwork: Artwork, secondaryButtons: SecondaryButtons) {
        self.titles = titles
        self.progress = progress
        self.artwork = artwork
        self.buttons = buttons
        self.audioSource = audioSource
        self.secondaryButtons = secondaryButtons
        super.init(nibName: "PlayerUI", bundle: nil)
        view.backgroundColor = .systemBackground
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
        self.embed(viewController: secondaryButtons, inContainerView: secondaryButtonContainer)
    }
    
}
