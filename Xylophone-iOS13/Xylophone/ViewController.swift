//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 28/06/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
// importing AudioVisual Foundation?? library
import AVFoundation

class ViewController: UIViewController {
    // Variable to store the player instance
    var player: AVAudioPlayer!

    // creating an IBAction linked with all the xylophone buttons
    @IBAction func keyPressed(_ sender: UIButton) {
        // Access the title of the button that was pressed and pass it to function playsound
        playSound(soundName: sender.currentTitle!)
        // Change the opacity of the button to half
        sender.alpha = 0.5
        // Dispatch queue is a queue which runs the code inside it on certain conditions
        // In this case we're using asyncAfter which runs the code inside after 0.2 seconds
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            // Change the opacity of the button back to 1
            sender.alpha = 1
        }
    }
    
    func playSound( soundName: String) {
        // Extract the audio resource and store it in a variable
        let url = Bundle.main.url(forResource: soundName, withExtension: "wav")
        // setup the player. Telling the player what to play
        player = try! AVAudioPlayer(contentsOf: url!)
        // play the audio
        player.play()
    }
}

