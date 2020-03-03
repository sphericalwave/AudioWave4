//
//  AudioWaveCell.swift
//  AudioWave
//
//  Created by Aaron Anthony on 2020-03-02.
//  Copyright © 2020 SphericalWave. All rights reserved.
//

import UIKit
import MediaPlayer

class AudioWaveCell: SwCell
{
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var artwork: UIImageView!
    @IBOutlet weak var indicator: UIImageView!
    override func height() -> CGFloat { return 81 } //FIXME: convert to var
    let audioSource: AudioSource
    
    init(musicPlayer: AudioSource) {
        self.audioSource = musicPlayer
        super.init(nibName: "AudioWaveCell", bundle: nil)   //FIXME: Scrap XIB
        accessoryType = .none
        selectionStyle = .default
    }
    required init?(coder: NSCoder) { fatalError() }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        artwork.layer.cornerRadius = 10.0   //FIXME: RoundedImage
        artwork.clipsToBounds = true
        updateArt()
    }
    
    override func didSelect() { fatalError("subclass") }
    func updateArt() { fatalError("subclass") }
}
