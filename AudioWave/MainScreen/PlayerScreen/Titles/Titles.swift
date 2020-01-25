//
//  Titles.swift
//  AudioWave
//
//  Created by Aaron Anthony on 2020-01-14.
//  Copyright © 2020 SphericalWave. All rights reserved.
//

import UIKit

//protocol TitleDelegate
//{
//    func update() ->(title: String, description: String)
//}

class Titles: UIViewController
{
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
  //  weak var delegate: TitleDelegate?
    
    init() { super.init(nibName: "Titles", bundle: nil) }
    
    required init?(coder: NSCoder) { fatalError() }
    
//    func update(title: String) { self.titleLabel.text = title }
//
//    func update(description: String) { descriptionLabel.text = description }
    
    func update(title: String, description: String) {
        titleLabel.text = title
        descriptionLabel.text = description
    }
}


