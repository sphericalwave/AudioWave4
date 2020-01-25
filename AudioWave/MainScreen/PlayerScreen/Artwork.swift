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
    let artwork: UIImageView!
    
    init(art: UIImage) {
        let a = UIImageView()
        a.image = art
        self.artwork = a
        super.init(nibName: nil, bundle: nil)
        view.backgroundColor = .blue
        view.layer.cornerRadius = 10.0
        view.clipsToBounds = true
        artwork.contentMode = .scaleAspectFill
        artwork.layer.cornerRadius = 10.0
        artwork.clipsToBounds = true
    }
    
    required init?(coder: NSCoder) { fatalError() }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        artwork.frame = view.frame
        artwork.backgroundColor = .green
        view.addSubview(artwork)
    }
    
    func update(art: UIImage) {
        //TODO: Connect Up
        print("Update Art")
        artwork.image = art
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
