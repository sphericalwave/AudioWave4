//
//  AudioSessionManager.swift
//  AudioWave2
//
//  Created by Aaron Anthony on 2017-06-10.
//  Copyright © 2017 SphericalWave. All rights reserved.
//

//SINGLE RESPONSIBILITY: Manage AudioSession & Handle Interuptions

import Foundation
import MediaPlayer

//NotificationCenter.default.addObserver(forName: .AVAudioSessionInterruption, object: self, queue: .main, using: handleInterruption)

protocol AudioHardwareDelegate: AnyObject {
    func pauseAudio()
    func playAudio()
}

class AudioHardware
{
    let audioSession: AVAudioSession
    weak var delegate: AudioHardwareDelegate?
    
    init() {
        self.audioSession = AVAudioSession.sharedInstance() //TODO: Inject / Convienience Method
        do { try audioSession.setCategory(AVAudioSession.Category.playback) }
        catch { print(error) }
        requestAudio()
    }
    
    func requestAudio() {
        if audioSession.isOtherAudioPlaying { print("Other Audio is Playing")}
        do { try audioSession.setActive(true) }
        catch { print(error) }
    }
    
    func denyAudio(_ notification: Notification) {
        guard let userInfo = notification.userInfo,
            let typeValue = userInfo[AVAudioSessionInterruptionTypeKey] as? UInt,
            let type = AVAudioSession.InterruptionType(rawValue: typeValue) else {
                return
        }
        if type == .began {
            print("Interuption Began...Pause Player...Update UI")
            delegate?.pauseAudio()
        }
        else if type == .ended {
            delegate?.playAudio()

//            if let optionsValue = userInfo[AVAudioSessionInterruptionOptionKey] as? UInt {
//                let options = AVAudioSession.InterruptionOptions(rawValue: optionsValue)
//                if options.contains(.shouldResume) {
//                    // Interruption Ended - playback should resume
//                    let playNotification = Notification(name: .resumePlayers)
//                    NotificationCenter.default.post(playNotification)
//                } else {
//                    // Interruption Ended - playback should NOT resume
//                    print("Audio Should Not Resume")
//                }
//            }
        }
    }
    
    func setupNotifications() {
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(handleInterruption), name: AVAudioSession.interruptionNotification, object: nil)
    }

    @objc func handleInterruption(notification: Notification) {
        guard let userInfo = notification.userInfo,
            let typeValue = userInfo[AVAudioSessionInterruptionTypeKey] as? UInt,
            let type = AVAudioSession.InterruptionType(rawValue: typeValue) else {
                return
        }
        if type == .began {
            // Interruption began, take appropriate actions
        }
        else if type == .ended {
            if let optionsValue = userInfo[AVAudioSessionInterruptionOptionKey] as? UInt {
                let options = AVAudioSession.InterruptionOptions(rawValue: optionsValue)
                if options.contains(.shouldResume) {
                    // Interruption Ended - playback should resume
                } else {
                    // Interruption Ended - playback should NOT resume
                }
            }
        }
    }

    

}

//// Helper function inserted by Swift 4.2 migrator.
//fileprivate func convertFromAVAudioSessionCategory(_ input: AVAudioSession.Category) -> String {
//	return input.rawValue
//}


