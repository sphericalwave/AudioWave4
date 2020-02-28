//
//  SwTextFieldCell.swift
//  FitWrench
//
//  Created by Aaron Anthony on 2019-08-05.
//  Copyright © 2019 SphericalWave. All rights reserved.
//

import UIKit

class SwTextFieldCell: SwCell {
    
    let textField: UITextField
    let xib = "SwTextFieldCell"
    let thumbnail: UIImage
    let name: String
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var textfieldView: UIView!
    @IBOutlet var imageView: UIImageView!
    
    init(name: String, thumbnail: UIImage, textField: UITextField) {
        self.textField = textField
        textField.textAlignment = .right
        self.thumbnail = thumbnail
        self.name = name
        super.init(nibName: xib, bundle: nil)
        self.selectionStyle = .default
    }
    
    convenience init(name: String, thumbnail: UIImage) {
        self.init(name: name, thumbnail: thumbnail, textField: UITextField(frame: CGRect.zero))
    }
    
    required init?(coder aDecoder: NSCoder) { fatalError() }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //textField.backgroundColor = .blue
        textfieldView.addSubview(textField)
        
        let bounds = textfieldView.bounds
        textField.frame = bounds

        //textfieldView.backgroundColor = .white
        imageView.image = thumbnail
        label.text = name
        
        textField.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        textField.translatesAutoresizingMaskIntoConstraints = true
    }
    
    override func didSelect() {
        textField.becomeFirstResponder()
    }
}
