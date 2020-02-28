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
    let playlist: MPMediaPlaylist
    
    init(playlist: MPMediaPlaylist) {
        self.playlist = playlist
        super.init(nibName: "PlaylistCell2", bundle: nil)   //FIXME: Scrap XIB
    }
    required init?(coder: NSCoder) { fatalError() }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        musicArt.layer.cornerRadius = 10.0
        musicArt.clipsToBounds = true
        titleLabel.text = playlist.name
        detailLabel.text = "Dunno Yet"
        updateArt()
    }
    
    override func height() -> CGFloat { return 81 }
    
    override func didSelect() {
        let data = MusicPlaylistScreenData(playlist: playlist)
        let playlistScreen = MusicPlaylistScreen(data: data)
        navigationController?.pushViewController(playlistScreen, animated: true)
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
    
