//
//  Notifications.swift
//  AudioWave
//
//  Created by Aaron Anthony on 2020-01-25.
//  Copyright © 2020 SphericalWave. All rights reserved.
//

import Foundation

enum Event {
    case denyAudio
    case enableAudio
    case pause
    case play
    case skip
    case next
}

extension Notification.Name {
    static let pausePlayers = Notification.Name("pausePlayers")
    static let resumePlayers = Notification.Name("resumePlayers")
}

class Notifications
{
    init() {
//        NotificationCenter.default.addObserver(forName: AVAudioSession.interruptionNotification, object: AVAudioSession.sharedInstance(), queue: .main, using: handleInterruption)
    }
    
    
    func handleInterruption(_ notification: Notification) {
//        guard let userInfo = notification.userInfo,
//            let typeValue = userInfo[AVAudioSessionInterruptionTypeKey] as? UInt,
//            let type = AVAudioSession.InterruptionType(rawValue: typeValue) else {
//                return
//        }
//        if type == .began {
//            print("Interuption Began") //TODO:
//        }
//        else if type == .ended {
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
//        }
    }
}
