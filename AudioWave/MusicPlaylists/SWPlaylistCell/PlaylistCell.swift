//
//  PlaylistCell.swift
//  AudioWave2
//
//  Created by Aaron Anthony on 2017-06-09.
//  Copyright © 2017 SphericalWave. All rights reserved.
//

import UIKit
import MediaPlayer

class PlaylistCell: SwCell
{
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var musicArt: UIImageView!
    @IBOutlet weak var indicator: UIImageView!
    let name: String
    let artist: String
    let art: UIImage
    
    init(name: String, artist: String, art: UIImage) {
        self.name = name
        self.artist = artist
        self.art = art
        super.init(nibName: "PlaylistCell2", bundle: nil)
        accessoryType = .disclosureIndicator
    }
    
    required init?(coder: NSCoder) { fatalError() }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        musicArt.layer.cornerRadius = 10.0
        musicArt.clipsToBounds = true
        titleLabel.text = name
        detailLabel.text = artist
        updateArt()
    }
    
    override func height() -> CGFloat { return 81 }
    
    func updateArt() {
        //TODO:
        musicArt.image = art
//        let size = self.musicArt.bounds.size
//        guard let sizedArt = art.image(at: size) else {
//            self.musicArt.image = sizedArt
//        } else {
//            self.musicArt.image = track.mediaType == .music ? #imageLiteral(resourceName: "mediumNote") : #imageLiteral(resourceName: "mediumBook")
//        }
    }
}
