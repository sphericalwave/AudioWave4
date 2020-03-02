//
//  TimeInterval+Extensions.swift
//  AudioWave
//
//  Created by Aaron Anthony on 2020-03-01.
//  Copyright © 2020 SphericalWave. All rights reserved.
//

import Foundation

extension TimeInterval
{
    mutating func readable() -> String {
        let timeInt = Int(Darwin.round(self))
        let (hh, mm, ss) = (timeInt / 3600, (timeInt % 3600) / 60, (timeInt % 3600) % 60)
        let hhString: String? = hh > 0 ? String(hh) : nil
        let mmString = (hh > 0 && mm < 10 ? "0" : "") + String(mm)
        let ssString = (ss < 10 ? "0" : "") + String(ss)
        return (hhString != nil ? (hhString! + ":") : "") + mmString + ":" + ssString
    }
}
