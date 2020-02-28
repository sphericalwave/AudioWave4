//
//  SwImageQuadLabelCell.swift
//  FitWrench
//
//  Created by Aaron Anthony on 2019-10-13.
//  Copyright © 2019 SphericalWave. All rights reserved.
//

import UIKit

class SwQuadLabelImageCell: SwCell
{
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var measurementLabel: UILabel!
    @IBOutlet weak var parameterLabel: UILabel!
    
    init() {
        super.init(nibName: "SwQuadLabelImageCell", bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) { fatalError() }
}
