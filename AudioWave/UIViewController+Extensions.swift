//
//  UIViewController+Extensions.swift
//  FoodConstruction
//
//  Created by Aaron Anthony on 2018-04-17.
//  Copyright © 2018 Aaron Anthony. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func setupViewLayoutConstraints(viewController: UIViewController, rect: CGRect) -> UIView {
        let newView = viewController.view!
        newView.translatesAutoresizingMaskIntoConstraints = true
        newView.autoresizingMask = [UIView.AutoresizingMask.flexibleWidth, UIView.AutoresizingMask.flexibleHeight]
        newView.frame = rect
        return newView
    }
    
    func embed(viewController: UIViewController, inContainerView: UIView) {
        self.addChild(viewController)
        let newView = setupViewLayoutConstraints(viewController: viewController, rect: inContainerView.bounds)
        inContainerView.addSubview(newView)
        viewController.didMove(toParent: self)
    }
}
