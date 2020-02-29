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
    let notifications = NotificationCenter.default  //FIXME: Hidden Dependency
    let player: AudioPlayer

    init(art: UIImage, player: AudioPlayer) {
        self.player = player
        let a = UIImageView()
        a.image = art
        self.artwork = a
        super.init(nibName: nil, bundle: nil)
        view.backgroundColor = .blue
        view.layer.cornerRadius = 10.0
        view.clipsToBounds = true
        artwork.layer.cornerRadius = 10.0
        artwork.clipsToBounds = true
        notifications.addObserver(self, selector: #selector(playerDidLoad), name: .didLoad, object: nil)
    }
    required init?(coder: NSCoder) { fatalError() }
    
    @objc func playerDidLoad(notification: Notification) {
        //FIXME: Update the Art
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        artwork.frame = view.frame
        artwork.backgroundColor = .green
        artwork.contentMode = .scaleAspectFill  //FIXME: Scale is misbehaving
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
