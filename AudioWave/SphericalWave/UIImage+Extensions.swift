//
//  UIImage+Extensions.swift
//  AudioWave
//
//  Created by Aaron Anthony on 2020-03-02.
//  Copyright © 2020 SphericalWave. All rights reserved.
//

import UIKit
import MediaPlayer

extension UIImageView
{
    func refresh(with art: MPMediaItemArtwork) {
        ////FIXME: Extension on UIImageView perhaps? Duplicated in itemCell, artwork, playlistCell
        let size = self.bounds.size
        guard let sizedArt = art.image(at: size) else {
            self.image = #imageLiteral(resourceName: "mediumNote")  //FIXME: Use SFSymbol
            return
        }
        self.image = sizedArt
        //artwork.refresh(with: art)
    }
}
