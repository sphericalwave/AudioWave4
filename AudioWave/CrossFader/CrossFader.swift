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
    let player1: AudioSource    //FIXME: Naming
    let player2: AudioSource
    
    init(player1: AudioSource, player2: AudioSource) {
        self.player1 = player1
        self.player2 = player2
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
        fade(position: sender.value)
    }

    enum FadeStrategy {
        case phi, log
    }

    func fade(position: Float, strategy: FadeStrategy = .phi) {
        switch strategy {
        case .phi: phiFade(position: position)
        case .log: logFade(position: position)
        }
    }

    private func phiFade(position: Float) {
        let vol1: Float
        let vol2: Float
        
        if position < 0.5 {
            vol1 = 2 * position
            vol2 = 1
        } else {
            vol1 = 1
            vol2 = -2 * position + 2
        }

        player1.volume(vol2)   //FIXME: These are swapped the wrong way as written but actually correct
        player2.volume(vol1)
    }
    
    private func logFade(position: Float) {
        //Log Cross Fader
        //let rightPlayerVolume = (0.5 * (0.9 + s) ).squareRoot()  //Not Necessarily Ideal
        //let leftPlayerVolume = (0.5 * (1 - s) ).squareRoot()
        
//        if s < -0.0414 {
//            leftPlayerVolume = 1
//            rightPlayerVolume = 0.707 + 0.707 * s
//        }
//        if s > -0.0414, s < 0.0414 {
//            leftPlayerVolume = 0.707 - 0.707 * s
//            rightPlayerVolume = 0.707 + 0.707 * s
//        }
//        if s > 0.0414 {
//            leftPlayerVolume = 0.707 - 0.707 * s
//            rightPlayerVolume = 1
//        }
    }
    
}
