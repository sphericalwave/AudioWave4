//
//  CrossFader.swift
//  AudioWave
//
//  Created by Aaron Anthony on 2020-01-15.
//  Copyright © 2020 SphericalWave. All rights reserved.
//

import UIKit

final class CrossFader: UIViewController
{
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var meterOne: UIImageView!
    @IBOutlet weak var meterTwo: UIImageView!
    let audioWave: PlaylistCombo

    init(audioWave: PlaylistCombo) {
        self.audioWave = audioWave
        super.init(nibName: "CrossFader", bundle: nil)
        view.backgroundColor = .black
    }
    required init?(coder: NSCoder) { fatalError() }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        slider.setThumbImage(#imageLiteral(resourceName: "Fader3"), for: .normal)
        meterOne.image = #imageLiteral(resourceName: "volume_meter")
        meterTwo.image = #imageLiteral(resourceName: "volume_meter")
    }
    
    @IBAction func sliderChanged(_ sender: UISlider) {
        audioWave.currentFade = sender.value
    }
}
