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

    init() {
        super.init(nibName: "PlayerScreen", bundle: nil)
        self.view.backgroundColor = .gray
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //FIXME: Inject Dependencies
        artworkContainer.backgroundColor = .blue
        self.embed(viewController: Progress(), inContainerView: artworkContainer)
        self.embed(viewController: Progress(), inContainerView: progressContainer)
        self.embed(viewController: Titles(), inContainerView: textContainer)
        self.embed(viewController: Buttons(), inContainerView: buttonContainer)
    }
    
    required init?(coder: NSCoder) { fatalError() }
}
