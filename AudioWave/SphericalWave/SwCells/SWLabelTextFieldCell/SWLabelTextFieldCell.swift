//
//  SWLabelTextfieldCell.swift
//  FitWrench
//
//  Created by Aaron Anthony on 2019-11-11.
//  Copyright © 2019 SphericalWave. All rights reserved.
//

import UIKit

class SWLabelTextFieldCell: SwCell
{
    let textField: UITextField
    let name: String
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var textfieldView: UIView!
    
    init(name: String, textField: UITextField) {
        self.textField = textField
        self.name = name
        super.init(nibName: "VendorCell", bundle: nil) //FIME: Change XIB name
        self.selectionStyle = .default
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = name
        textField.frame = textfieldView.bounds
        textfieldView.addSubview(textField)
        textfieldView.backgroundColor = nil
        textField.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        textField.translatesAutoresizingMaskIntoConstraints = true
    }
    
    override func didSelect() { textField.becomeFirstResponder() }
    
    required init?(coder aDecoder: NSCoder) { fatalError() }
}
