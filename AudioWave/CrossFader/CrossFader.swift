//
//  CrossFader.swift
//  AudioWave
//
//  Created by Aaron Anthony on 2020-01-15.
//  Copyright © 2020 SphericalWave. All rights reserved.
//

import UIKit

class CrossFader: UIViewController
{
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var meterOne: UIImageView!
    @IBOutlet weak var meterTwo: UIImageView!
    
    init() {
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
        phiFade(position: sender.value)
    }
    
    func phiFade(position: Float) {
        var vol1: Float = 1
        var vol2: Float = 2
        
        if position < 0.5 {
            vol1 = 2 * position
            vol2 = 1
        }
        if position >= 0.5 {
            vol1 = 1
            vol2 = -2 * position + 2
        }
        
        NotificationCenter.default.post(name: .faderChanged,
                                        object: Fader(vol1: vol2, vol2: vol1))
    }
}

struct Fader
{
    let vol1: Float
    let vol2: Float
}
