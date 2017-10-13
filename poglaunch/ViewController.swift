//
//  ViewController.swift
//  poglaunch
//
//  Created by nadia on 11.10.17.
//  Copyright © 2017 nadia. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var launchModeView: UIView!
    @IBOutlet weak var onLabel: UILabel!
    @IBOutlet weak var launchLabel: UILabel!
    @IBOutlet weak var rocedimageView: UIImageView!
    
    
    var player: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let path = Bundle.main.path(forResource: "rocket_launch", ofType: "mp3")!
        let url = URL(fileURLWithPath: path)
        player = try? AVAudioPlayer(contentsOf: url)
        player?.prepareToPlay()
    }
    
    
    @IBAction func launchPressed(_ sender: Any) {
        launchModeView.isHidden = false
        player?.play()
        UIView.animate(withDuration: 3.0, animations: {
            var rocketFrame = self.rocedimageView.frame
            rocketFrame.origin.y = 70
            self.rocedimageView.frame = rocketFrame
        }) { _ in
            self.launchLabel.isHidden = false
            self.onLabel.isHidden = false
        }
    }
}

