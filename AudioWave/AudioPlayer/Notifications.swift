//
//  Notifications.swift
//  AudioWave
//
//  Created by Aaron Anthony on 2020-01-25.
//  Copyright © 2020 SphericalWave. All rights reserved.
//

import Foundation

extension Notification.Name
{
    static let didPrevious = Notification.Name("didPrevious")
    static let didSkip = Notification.Name("didSkip")
    static let didPause = Notification.Name("didPause")
    static let didLoad = Notification.Name("didLoad")
    static let didPlay = Notification.Name("didPlay")
    static let faderChanged = Notification.Name("faderChanged")
}
