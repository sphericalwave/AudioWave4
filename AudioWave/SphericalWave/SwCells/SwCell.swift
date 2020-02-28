//
//  SWCell.swift
//  FitWrench
//
//  Created by Aaron Anthony on 2019-04-23.
//  Copyright © 2019 SphericalWave. All rights reserved.
//

import UIKit

class SwCell: UIViewController {
    
    var accessoryType: UITableViewCell.AccessoryType = .none
    var selectionStyle: UITableViewCell.SelectionStyle = .none
    
    func didSelect() { fatalError("Override in Subclass") }
    func height() -> CGFloat { return 54 }
}
