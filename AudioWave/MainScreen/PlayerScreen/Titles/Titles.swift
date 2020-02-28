//
//  Titles.swift
//  AudioWave
//
//  Created by Aaron Anthony on 2020-01-14.
//  Copyright © 2020 SphericalWave. All rights reserved.
//

import UIKit

class Titles: UIViewController
{
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    init() { super.init(nibName: "Titles", bundle: nil) }
    
    required init?(coder: NSCoder) { fatalError("Bad Monkey!") }
    
    func update(title: String, description: String) {
        titleLabel.text = title
        descriptionLabel.text = description
    }
}


