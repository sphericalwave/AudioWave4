//
//  SWDualLabelCell.swift
//  FitWrench
//
//  Created by Aaron Anthony on 2019-11-11.
//  Copyright © 2019 SphericalWave. All rights reserved.
//

import UIKit

class SWDualLabelCell: SwCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    let rightText: String
    let leftText: String
    
    init(rightText: String, leftText: String) {
        self.rightText = rightText
        self.leftText = leftText
        super.init(nibName: "SWDualLabelCell", bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) { fatalError() }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.nameLabel.text = rightText
        self.detailLabel.text = leftText
    }
    
    override func didSelect() { return }
}
