//
//  MediaPermission.swift
//  AudioWave
//
//  Created by Aaron Anthony on 2020-03-04.
//  Copyright © 2020 SphericalWave. All rights reserved.
//

import Foundation
import MediaPlayer

class MediaPermission
{
    let audioSource1: AudioSource
    let audioSource2: AudioSource
    let mediaLibrary: AudioLibrary
    let parent: UIViewController    //FIXME: Concerned about refference cycle
    
    //FIXME : inject a closure to remove refference to parent?
    init(audioSource1: AudioSource, audioSource2: AudioSource, mediaLibrary: AudioLibrary, parent: UIViewController) {
        self.audioSource1 = audioSource1
        self.audioSource2 = audioSource2
        self.mediaLibrary = mediaLibrary
        self.parent = parent
    }
    
    //FIXME: Move into a Permission object
    func requestLibraryPermissions() {
        MPMediaLibrary.requestAuthorization() { status in   //FIXME: Fragile
            if status == .authorized {
                DispatchQueue.main.async {
                    let leftButton = PlaylistsButton(audioSource: self.audioSource1, audioLibrary: self.mediaLibrary, parent: self.parent)
                    self.parent.navigationItem.leftBarButtonItem = leftButton   //FIXME: Encapsulation Violation
                    
                    let rightButton = PlaylistsButton(audioSource: self.audioSource2, audioLibrary: self.mediaLibrary, parent: self.parent)
                    self.parent.navigationItem.rightBarButtonItem = rightButton  //FIXME: Encapsulation Violation
                }
            }
            else {
                //FIXEM: present alert
                DispatchQueue.main.async {
                    let alert = UIAlertController(title: "Red Alert", message: "To use this app your permission to access your media library on device is required. Go to AudioWave in the settings app to give permission", preferredStyle: .alert)
                    let action = UIAlertAction(title: "Permit", style: .default) { _ in
                        //self.requestLibraryPermissions()
                        UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!, options: [:], completionHandler: nil)
                    }
                    alert.addAction(action)
                    self.parent.present(alert, animated: true, completion: nil)
                }
            }
        }
    }
}
