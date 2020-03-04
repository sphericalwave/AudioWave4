//
//  Titles.swift
//  AudioWave
//
//  Created by Aaron Anthony on 2020-01-14.
//  Copyright © 2020 SphericalWave. All rights reserved.
//

import UIKit

class Titles: UIViewController
{
    @IBOutlet weak var titleContainer: UIView!
    @IBOutlet weak var descriptionContainer: UIView!
    let notifications = NotificationCenter.default  //FIXME: Hidden Dependency
    let audioSource: AudioSource
    var titleLabel: MarqueeLabel!   //FIXME: bang
    var descriptionLabel: MarqueeLabel! //FIXME: bang
    
    init(audioSource: AudioSource) {
        self.audioSource = audioSource
        super.init(nibName: "Titles", bundle: nil)
        notifications.addObserver(self, selector: #selector(playerDidLoad), name: .didLoad, object: audioSource)
    }
    required init?(coder: NSCoder) { fatalError() }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("bounds: \(titleContainer.bounds) frame: \(titleContainer.frame)")
        
        self.titleLabel = MarqueeLabel(frame: titleContainer.bounds, duration: 8, fadeLength: 10)
        titleLabel.textAlignment = .center
        titleLabel.textColor = .black
        titleLabel.backgroundColor = .gray
        titleContainer.addSubview(titleLabel)
        
        self.descriptionLabel = MarqueeLabel(frame: titleContainer.bounds, duration: 8, fadeLength: 10)
        descriptionLabel.textAlignment = .center
        descriptionLabel.textColor = .black
        titleLabel.backgroundColor = .gray
        descriptionContainer.addSubview(descriptionLabel)
    }
    
    @objc func playerDidLoad(notification: Notification) {
        descriptionLabel.text = audioSource.artist()
        descriptionLabel.restartLabel()
        titleLabel.text = audioSource.track()
        titleLabel.restartLabel()   //FIXME: Unpleasant API on MarqueeLabel
        
        print("Titles >> bounds: \(titleContainer.bounds) frame: \(titleContainer.frame)")

    }
}


