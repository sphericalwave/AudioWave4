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
    let player1: MusicPlayer    //FIXME: Naming
    let player2: MusicPlayer
    
    init(player1: MusicPlayer, player2: MusicPlayer) {
        self.player1 = player1
        self.player2 = player2
        super.init(nibName: "CrossFader", bundle: nil)
        view.backgroundColor = .black
    }
    required init?(coder: NSCoder) { fatalError() }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        slider.setThumbImage(#imageLiteral(resourceName: "Fader3"), for: .normal)
    }
    
    @IBAction func sliderChanged(_ sender: UISlider) {
        
        //TODO: Change Player1 and PLayer2 Volumes
        /*
         returns a float array with two indexes representing the volumes of the left (index 0) and right (index 1) channels
         when t is -1, volumes[0] = 0, volumes[1] = 1
         when t = 0, volumes[0] = 0.707, volumes[1] = 0.707 (equal-power cross fade)
         when t = 1, volumes[0] = 1, volumes[1] = 0
         */
        
        var leftPlayerVolume: Float = 0
        var rightPlayerVolume: Float = 0
        let s = sender.value
        
        //Log Cross Fader
        //let rightPlayerVolume = (0.5 * (0.9 + s) ).squareRoot()  //Not Necessarily Ideal
        //let leftPlayerVolume = (0.5 * (1 - s) ).squareRoot()
        
        if s < -0.0414 {
            leftPlayerVolume = 1
            rightPlayerVolume = 0.707 + 0.707 * s
        }
        if s > -0.0414, s < 0.0414 {
            leftPlayerVolume = 0.707 - 0.707 * s
            rightPlayerVolume = 0.707 + 0.707 * s
        }
        if s > 0.0414 {
            leftPlayerVolume = 0.707 - 0.707 * s
            rightPlayerVolume = 1
        }
        
        player1.volume(leftPlayerVolume)
        player2.volume(rightPlayerVolume)
    }
}
