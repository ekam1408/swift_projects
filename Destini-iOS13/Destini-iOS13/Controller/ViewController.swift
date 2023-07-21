//
//  ViewController.swift
//  Destini-iOS13
//
//  Created by Angela Yu on 08/08/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var storyLabel: UILabel!
    @IBOutlet weak var choice1Button: UIButton!
    @IBOutlet weak var choice2Button: UIButton!
    
    var stories = StoryBrain();
    
    override func viewDidLoad() {
        super.viewDidLoad();
        updateUI();
    }

    @IBAction func choiceMade(_ sender: UIButton) {
        stories.nextStory();
        updateUI();
    }
    
    func updateUI() {
        let story = stories.getCurrentStory();
        storyLabel.text = story.question;
        choice1Button.setTitle(story.options[0], for: .normal)
        choice2Button.setTitle(story.options[1], for: .normal)
    }
}

