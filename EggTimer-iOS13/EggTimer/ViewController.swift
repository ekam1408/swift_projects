//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    var player: AVAudioPlayer!
    
    @IBOutlet weak var heading: UILabel!
    
    
    let eggTimes = ["Soft": 3, "Medium": 5, "Hard": 8];
    
    @IBOutlet weak var progressView: UIProgressView!
    var timerInstance = Timer()
    @IBAction func eggPressed(_ sender: UIButton) {
        heading.text = sender.currentTitle!;
        progressView.progress = 0;
        timerInstance.invalidate();
        
        startTimer(eggTime: eggTimes[sender.currentTitle!]!);
    }
    

    func startTimer(eggTime: Int) {
        var timer = eggTime;
        timerInstance = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true){ [self] _ in
            progressView.progress = Float(eggTime - timer)/Float(eggTime);
            if timer == 0 {
                timerInstance.invalidate();
                playSound();
            }
            timer -= 1;
        }
    }
    
    func playSound() {
        heading.text = "Done!"
        let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play();
    }
}
