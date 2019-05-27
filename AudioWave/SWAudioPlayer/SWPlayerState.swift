//
//  SWPlayerState.swift
//  AudioWave
//
//  Created by Aaron Anthony on 2017-08-29.
//  Copyright © 2017 SphericalWave. All rights reserved.
//

import Foundation
import MediaPlayer

class SWPlayerState: NSObject, NSCoding {
    
    let playbackTime: Double
    let currentItemID: MPMediaEntityPersistentID
    let playbackItemIDs: [MPMediaEntityPersistentID]
    let speed: Float

    init(playbackTime: Double, currentItemID: MPMediaEntityPersistentID, playbackItemIDs: [MPMediaEntityPersistentID], speed: Float ) {
        self.playbackTime = playbackTime
        self.currentItemID = currentItemID
        self.playbackItemIDs = playbackItemIDs
        self.speed = speed
        super.init()
    }

    required init?(coder aDecoder: NSCoder) {
        self.playbackTime = aDecoder.decodeDouble(forKey: "playbackTime")
        self.currentItemID = (aDecoder.decodeObject(forKey: "currentItemID") as! NSNumber).uint64Value
        let itemIDs = (aDecoder.decodeObject(forKey: "playbackItemIDs") as! [MPMediaEntityPersistentID])
        self.playbackItemIDs = itemIDs
        self.speed = aDecoder.decodeFloat(forKey: "speed")
        super.init()
    }

    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.currentItemID, forKey: "currentItemID")
        aCoder.encode(self.playbackTime, forKey: "playbackTime")
        aCoder.encode(self.playbackItemIDs, forKey: "playbackItemIDs")
        aCoder.encode(self.speed, forKey: "speed")
    }
}

