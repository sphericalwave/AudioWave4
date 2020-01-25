//
//  SwLabelCell.swift
//  FitWrench
//
//  Created by Aaron Anthony on 2019-10-13.
//  Copyright © 2019 SphericalWave. All rights reserved.
//

import UIKit

class SwLabelCell: SwCell
{
    @IBOutlet var label: UILabel!
    @IBOutlet var imageView: UIImageView!
    let text: String
    let image: UIImage
    
    init(text: String, image: UIImage) {
        self.text = text
        self.image = image
        super.init(nibName: "SwLabelCell", bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) { fatalError() }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = text
        imageView.image = image
    }
}
