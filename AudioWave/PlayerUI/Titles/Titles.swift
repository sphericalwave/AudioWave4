//
//  Titles.swift
//  AudioWave
//
//  Created by Aaron Anthony on 2020-01-14.
//  Copyright © 2020 SphericalWave. All rights reserved.
//

import UIKit

//FIXME: SwiftUI
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
        //print("Titles: titleContainer bounds: \(titleContainer.bounds) frame: \(titleContainer.frame)")
        
        self.titleLabel = MarqueeLabel(frame: titleContainer.bounds, duration: 8, fadeLength: 10)
        titleLabel.textAlignment = .center
        titleLabel.textColor = .black
        //titleLabel.backgroundColor = .gray
        titleContainer.addSubview(titleLabel)
        titleContainer.backgroundColor = .clear //FIXME: Remove
        
        self.descriptionLabel = MarqueeLabel(frame: titleContainer.bounds, duration: 8, fadeLength: 10)
        descriptionLabel.textAlignment = .center
        descriptionLabel.textColor = .black
        //descriptionLabel.backgroundColor = .gray
        descriptionContainer.addSubview(descriptionLabel)
        descriptionContainer.backgroundColor = .clear //FIXME: Remove
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
//        print("\nTitles: viewDidAppear")
//        print("Titles: titleContainer bounds: \(titleContainer.bounds) frame: \(titleContainer.frame)")
//        print("Titles: titleLabel bounds: \(titleLabel.bounds) frame: \(titleLabel.frame)\n")
        titleLabel.frame = titleContainer.frame
    }
    
    @objc func playerDidLoad(notification: Notification) {
        descriptionLabel.text = audioSource.artist()
        descriptionLabel.restartLabel()
        titleLabel.text = audioSource.track()
        titleLabel.restartLabel()   //FIXME: Unpleasant API on MarqueeLabel
//        print("\nTitles: playerDidLoad")
//        print("Titles: titleContainer bounds: \(titleContainer.bounds) frame: \(titleContainer.frame)")
//        print("Titles: titleLabel bounds: \(titleLabel.bounds) frame: \(titleLabel.frame)\n")
        titleLabel.frame = titleContainer.bounds
        descriptionLabel.frame = descriptionContainer.bounds
    }
}


