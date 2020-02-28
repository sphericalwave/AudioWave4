//
//  Memento.swift
//  AudioWave2
//
//  Created by Aaron Anthony on 2017-06-12.
//  Copyright © 2017 SphericalWave. All rights reserved.
//

import Foundation
import MediaPlayer

class Memento: NSObject, NSCoding {
    
    let collectionID: UInt64
    let itemID: UInt64
    let volume: Float
    let time: Double
    
    init(collectionID: MPMediaEntityPersistentID, itemID: MPMediaEntityPersistentID, volume: Float, time: TimeInterval) {
        self.collectionID = collectionID
        self.itemID = itemID
        self.volume = volume
        self.time = time
        super.init()
        print("Collection ID \(collectionID)")
        print("itemID \(itemID)")
        print("Volume \(volume)")
        print("time \(time)\n")
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        let collectionID = (aDecoder.decodeObject(forKey: "collectionID") as! NSNumber).uint64Value
        let itemID = (aDecoder.decodeObject(forKey: "itemID") as! NSNumber).uint64Value
        let time = aDecoder.decodeDouble(forKey: "time")
        let volume = aDecoder.decodeFloat(forKey:"volume")
        
        print("Collection ID \(collectionID)")
        print("itemID \(itemID)")
        print("Volume \(volume)")
        print("time \(time)\n")
        
        
        self.collectionID = collectionID
        self.itemID = itemID
        self.time = time
        self.volume = volume
        
        super.init()
    }
    
    func encode(with aCoder: NSCoder) {
        
        let collectionID = NSNumber.init(value: self.collectionID)
        aCoder.encode(collectionID, forKey: "collectionID")
        
        let itemID = NSNumber.init(value: self.itemID)
        aCoder.encode(itemID, forKey: "itemID")
        
        aCoder.encode(self.time, forKey: "time")
        aCoder.encode(self.volume, forKey: "volume")
    }
    
    
}
