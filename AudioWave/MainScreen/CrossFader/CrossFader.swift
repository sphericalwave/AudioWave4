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
    let player1: AudioPlayer
    let player2: AudioPlayer
    
    init(player1: AudioPlayer, player2: AudioPlayer) {
        self.player1 = player1
        self.player2 = player2
        super.init(nibName: "CrossFader", bundle: nil)
        view.backgroundColor = .black
    }
    required init?(coder: NSCoder) { fatalError() }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        slider.setThumbImage(#imageLiteral(resourceName: "Fader3"), for: .normal)
        //slider.setMaximumTrackImage(#imageLiteral(resourceName: "transparentSlider"), for: .normal)
        //slider.setMinimumTrackImage(#imageLiteral(resourceName: "transparentSlider"), for: .normal)
    }
    
    @IBAction func sliderChanged(_ sender: UISlider) {
        
        //TODO: Change Player1 and PLayer2 Volumes
        /*
         returns a float array with two indexes representing the volumes of the left (index 0) and right (index 1) channels
         when t is -1, volumes[0] = 0, volumes[1] = 1
         when t = 0, volumes[0] = 0.707, volumes[1] = 0.707 (equal-power cross fade)
         when t = 1, volumes[0] = 1, volumes[1] = 0
         */
        
//        var contentVol: Float = 0
//        var musicVol: Float = 0
//        let s = sender.value
        
        //Log Cross Fader
        //        let musicVol = (0.5 * (0.9 + s) ).squareRoot()  //Not Necessarily Ideal
        //        let contentVol = (0.5 * (1 - s) ).squareRoot()
        
//        if s < -0.0414 {
//            contentVol = 1
//            musicVol = 0.707 + 0.707 * s
//        }
//        if s > -0.0414, s < 0.0414 {
//            contentVol = 0.707 - 0.707 * s
//            musicVol = 0.707 + 0.707 * s
//        }
//        if s > 0.0414 {
//            contentVol = 0.707 - 0.707 * s
//            musicVol = 1
//        }
        
        //        audioBookPlayerVC.volume = contentVol
        //        musicPlayerVC.volume = musicVol
    }
}

//let documentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
//let sliderURL = URL(fileURLWithPath: "slider", relativeTo: documentsDirectory)


//    // MARK: - Archiving

//    func save(_ notification: Notification) {

// NotificationCenter.default.addObserver(forName: UIApplication.willTerminateNotification, object: nil, queue: .main, using: save)

//        let saveSucceeded = NSKeyedArchiver.archiveRootObject(fader.value, toFile: SWCrossFaderVC.sliderURL.path)
//        if !saveSucceeded {
//            fatalError("Failed to save musicPlayer state...")
//        }
//    }
//
//    func restore() {
//        guard let value = NSKeyedUnarchiver.unarchiveObject(withFile: SWCrossFaderVC.sliderURL.path) as? Float else {
//            return
//        }
//        fader.value = value
//        self.faderChanged(fader)
//    }
