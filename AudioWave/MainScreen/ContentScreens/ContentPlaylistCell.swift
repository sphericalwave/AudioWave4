//
//  ContentPlaylistCell.swift
//  AudioWave
//
//  Created by Aaron Anthony on 2020-02-28.
//  Copyright © 2020 SphericalWave. All rights reserved.
//

import UIKit
import MediaPlayer

class ContentPlaylistCell: SwCell
{
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var musicArt: UIImageView!
    @IBOutlet weak var indicator: UIImageView!
    let playlist: MPMediaItemCollection
    let contentPlayer: ContentPlayer //FIXME:
    
    init(playlist: MPMediaItemCollection, contentPlayer: ContentPlayer) {
        self.playlist = playlist
        self.contentPlayer = contentPlayer
        super.init(nibName: "PlaylistCell2", bundle: nil)   //FIXME: Scrap XIB
    }
    required init?(coder: NSCoder) { fatalError() }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        musicArt.layer.cornerRadius = 10.0
        musicArt.clipsToBounds = true
        titleLabel.text = "Working on it" //FIXME: playlist.name
        detailLabel.text = "Dunno Yet"
        updateArt()
    }
    
    override func height() -> CGFloat { return 81 }
    
    override func didSelect() {
        let data = ContentPlaylistScreenData(playlist: playlist, contentPlayer: contentPlayer)
        let contentScreen = ContentPlaylistScreen(data: data)
        navigationController?.pushViewController(contentScreen, animated: true)
    }

    //FIXME: Refactor, Duplicated in TrackCell
    func updateArt() {
        guard let song = playlist.representativeItem else { fatalError() }
        let size = musicArt.bounds.size
        guard let sizedArt = song.artwork?.image(at: size) else {
            musicArt.image = #imageLiteral(resourceName: "mediumNote") //FIXME: Use SFSymbol
            return
        }
        musicArt.image = sizedArt
    }
}
