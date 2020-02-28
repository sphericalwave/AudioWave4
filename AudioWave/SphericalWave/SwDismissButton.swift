//
//  DismissNavButton.swift
//  FitWrench
//
//  Created by Aaron Anthony on 2019-06-30.
//  Copyright © 2019 SphericalWave. All rights reserved.
//

import UIKit

class SwDismissButton: UIBarButtonItem
{
    let parentScreen: UIViewController
    
    required init(parentScreen: UIViewController) {
        self.parentScreen = parentScreen
        super.init()
        self.action = #selector(SwDismissButton.didTap)
        guard let note = UIImage(systemName: "xmark") else { fatalError() } //FIXME: Fragile
        self.image = note
    }
    
    required init?(coder aDecoder: NSCoder) { fatalError() }
    
    @objc func didTap(_ sender: Any) { parentScreen.dismiss(animated: true) }
}
