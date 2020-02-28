//
//  SwImageDetailCell.swift
//  FitWrench
//
//  Created by Aaron Anthony on 2019-10-12.
//  Copyright © 2019 SphericalWave. All rights reserved.
//

import UIKit

class SwImageLabelCell: SwCell {
    
    let detailScreen: UIViewController
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var labelOne: UILabel!
    @IBOutlet var labelTwo: UILabel!
    @IBOutlet var labelThree: UILabel!
    
    init(detailScreen: UIViewController) {
        self.detailScreen = detailScreen
        super.init(nibName: "SwImageLabelCell", bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) { fatalError() }
    
    override func height() -> CGFloat { return 63 }
    
    override func didSelect() {
        self.navigationController?.pushViewController(detailScreen, animated: true)
    }
}
