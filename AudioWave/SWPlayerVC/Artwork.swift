//
//  Artwork.swift
//  AudioWave
//
//  Created by Aaron Anthony on 2020-01-14.
//  Copyright © 2020 SphericalWave. All rights reserved.
//

import UIKit

class Artwork: UIViewController
{
    @IBOutlet weak var artworkImageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        //self.view.layer.cornerRadius = 10.0
        //self.view.clipsToBounds = true
        artworkImageView.layer.cornerRadius = 10.0
        artworkImageView.clipsToBounds = true
    }
    
    func updateArtworkImageView() {
//        self.artworkImageView.image = self.player.currentPlaybackItem?.artwork?.image(at: artworkImageView.frame.size) //UIImage(named: self.player.currentPlaybackItem?.albumImageName ?? "")
    }
    
//    @IBAction func swipeLeftAction(_ sender: AnyObject) {
//        if self.player.nextPlaybackItem == nil {
//            self.animateNoNextTrackBounce(self.artworkImageView.layer)
//            return
//        }
//        
//        self.animateContentChange(convertFromCATransitionSubtype(CATransitionSubtype.fromRight), layer: self.artworkImageView.layer)
//        self.player.nextTrack()
//    }
//    
//    @IBAction func swipeRightAction(_ sender: AnyObject) {
//        if self.player.previousPlaybackItem == nil {
//            self.animateNoPreviousTrackBounce(self.artworkImageView.layer)
//            return
//        }
//        
//        self.animateContentChange(convertFromCATransitionSubtype(CATransitionSubtype.fromLeft), layer: self.artworkImageView.layer)
//        self.player.previousTrack()
//    }
}
