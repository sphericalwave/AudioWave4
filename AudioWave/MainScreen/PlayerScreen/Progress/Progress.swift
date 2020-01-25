//
//  PlaybackProgress.swift
//  AudioWave
//
//  Created by Aaron Anthony on 2020-01-14.
//  Copyright © 2020 SphericalWave. All rights reserved.
//

import UIKit

protocol ProgressDelegate: AnyObject {
    func update() -> (percent: Float, remain: Float, elapsed: Float) //Send Remaining/Elapsed/Percent
    func seekTo(percent: Float)
}

class Progress: UIViewController
{
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var elapsedTimeLabel: UILabel!
    @IBOutlet weak var remainingTimeLabel: UILabel!
    weak var delegate: ProgressDelegate?
    var timer: Timer?   //FIXME: Inject This messes up the constructor
    
    init() { super.init(nibName: "Progress", bundle: nil) }
    
    required init?(coder: NSCoder) { fatalError() }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        slider.setThumbImage(#imageLiteral(resourceName: "ProgressSliderThumb"), for: .normal)
        self.timer = Timer.scheduledTimer(withTimeInterval: 10, repeats: true) { _ in
            guard let result = self.delegate?.update() else { return }
            self.slider.value = result.percent
            self.elapsedTimeLabel.text = String(result.elapsed) //FIXME: Optimize
            self.remainingTimeLabel.text = String(result.remain)
        }
    }
    
    @IBAction func sliderChanged(_ sender: AnyObject) {
        delegate?.seekTo(percent: slider.value)
    }
    
    func updateSlider() {
        slider.minimumValue = 0
        //slider.maximumValue = Float(self.player.duration ?? 0)
    }
}
