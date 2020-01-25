//
//  MusicPlaylistButton.swift
//  AudioWave
//
//  Created by Aaron Anthony on 2020-01-20.
//  Copyright © 2020 SphericalWave. All rights reserved.
//

import UIKit

class SwModalButton: UIBarButtonItem
{
    let destinationScreen: UIViewController
    let parentScreen: UIViewController  //FIXME: Confirm abscence of circular refference
    
    init(image: UIImage, destinationScreen: UIViewController, parentScreen: UIViewController) {
        self.destinationScreen = destinationScreen
        self.parentScreen = parentScreen
        super.init()
        self.action = #selector(SwModalButton.didTap)
        self.style = .plain
        self.image = image
        self.width = 26
    }
    
    @objc func didTap(_ sender: Any) {
        let nav = UINavigationController(rootViewController: destinationScreen)
        parentScreen.present(nav, animated: true, completion: nil)
    }
    
    required init?(coder aDecoder: NSCoder) { fatalError() }
}


