//
//  AudioWave.swift
//  AudioWave
//
//  Created by Aaron Anthony on 2020-01-25.
//  Copyright © 2020 SphericalWave. All rights reserved.
//

import UIKit

class AudioWave: UINavigationController
{
    let remote: Remote
    let audioHardware: AudioHardware
    
    init() {
        self.remote = Remote()
        self.audioHardware = AudioHardware()
        let p1 = AudioSourceUI(audioSource: AudioSource())
        let p22 = AudioSourceUI(audioSource: AudioSource())
    
        let mainScreen = MainScreen(scrollScreen: Scroller(playerOneUI: p1, playerTwoUI: p22),
                                    crossFader: CrossFader())
        
        super.init(rootViewController: mainScreen)
        navigationBar.barStyle = .black
        audioHardware.activate()  //FIXME: activate when you press play
        
//        let mp = MediaPermission(audioSource1: audioSource1, audioSource2: audioSource2, mediaLibrary: audioLibrary, parent: self)  //FIXME: Refference Cycle!
//        mediaPermission?.requestLibraryPermissions()    //FIXME: Refference Cycle!
    }
    required init?(coder aDecoder: NSCoder) { fatalError("Ne Pas") }
}
