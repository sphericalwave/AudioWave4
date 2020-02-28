//
//  ImageCell.swift
//  FitWrench
//
//  Created by Aaron Anthony on 2019-07-03.
//  Copyright © 2019 SphericalWave. All rights reserved.
//

import UIKit

class SWImageCell: SwCell {
    
    let image: UIImage
    let xib = "ImageCell"
    
    @IBOutlet weak var imageView: UIImageView!
    
    required init?(coder aDecoder: NSCoder) { fatalError() }

    init(image: UIImage) {
        self.image = image
        super.init(nibName: xib, bundle: nil)
        self.selectionStyle = .default
    }
    
    override func didSelect() { return }
    
    override func height() -> CGFloat { return 375 }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.imageView.image = self.image
    }
}
