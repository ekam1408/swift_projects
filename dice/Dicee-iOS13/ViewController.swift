//
//  ViewController.swift
//  Dicee-iOS13
//
//  Created by Angela Yu on 11/06/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // Linked the dice 1 in story board to the below statement (variable diceImageView1 holds the value)
    // IB means interface builder (which is the other name of the storyboard dashboard??)
    // hover over the breakpoint/dot thingy on the left of the variable (inside the editor) and it highlights the specific UI parts inside the storybook
    @IBOutlet weak var diceImageView1: UIImageView!
    @IBOutlet weak var diceImageView2: UIImageView!
    
    // there is no need for this function in this case but for the sake of learning
    // Below function triggers once the UI loads on the app
    override func viewDidLoad() {
        // calling the parent component's viewDidLoad
        super.viewDidLoad()
    }
    
    // Below function runs on roll button press
    @IBAction func onShuffle(_ sender: UIButton) {
        // creating an array of all the possible values of the dice
        // let creates a const in swift. weird but ok. So, diceFaces is immutable
        let diceFaces = ["DiceOne", "DiceTwo", "DiceThree", "DiceFour", "DiceFive", "DiceSix"]
        
        // Insert images by using the imageLiterals (UIImage)
        // changing the image property of diceImageView1 and diceImageView2
        diceImageView1.image = UIImage(imageLiteralResourceName: diceFaces.randomElement() ?? "DiceOne")
        // array.randomElement() picks any random value from the array
        // ?? represents optional chaining, i.e., if first input fails, second works
        diceImageView2.image = UIImage(imageLiteralResourceName: diceFaces.randomElement() ?? "DiceOne")
        
    }
}

