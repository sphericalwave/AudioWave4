//
//  ContentCell.swift
//  AudioWave
//
//  Created by Aaron Anthony on 2020-02-28.
//  Copyright © 2020 SphericalWave. All rights reserved.
//

import UIKit
import MediaPlayer

class ContentCell: SwCell
{
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var musicArt: UIImageView!
    @IBOutlet weak var indicator: UIImageView!
    let mediaItem: MPMediaItem
    let contentPlayer: ContentPlayer
    
    init(mediaItem: MPMediaItem, contentPlayer: ContentPlayer) {
        self.mediaItem = mediaItem
        self.contentPlayer = contentPlayer
        super.init(nibName: "PlaylistCell2", bundle: nil)   //FIXME: Remove XIB
        accessoryType = .none
        selectionStyle = .default
    }
    required init?(coder: NSCoder) { fatalError() }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        musicArt.layer.cornerRadius = 10.0
        musicArt.clipsToBounds = true
        titleLabel.text = mediaItem.title ?? "FIXME"
        detailLabel.text = mediaItem.artist ?? "FIXME"
        updateArt()
    }
    
    override func height() -> CGFloat { return 81 }
    
    override func didSelect() {
        //Play the Track
        contentPlayer.play(mediaItem)
    }

    func updateArt() {
        let size = musicArt.bounds.size
        guard let sizedArt = mediaItem.artwork?.image(at: size) else {
            musicArt.image = #imageLiteral(resourceName: "mediumNote")  //FIXME: Use SFSymbol
            return
        }
        musicArt.image = sizedArt
    }
}
