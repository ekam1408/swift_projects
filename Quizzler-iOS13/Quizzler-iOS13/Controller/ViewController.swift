//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var questionView: UILabel!
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var scoreTracker: UILabel!
    
    var quiz = QuizBrain();
    override func viewDidLoad() {
        super.viewDidLoad();
        updateUI();
    }

    @IBAction func onPress(_ sender: UIButton) {
        sender.backgroundColor = quiz.verifyAnswer(sender.currentTitle == "True") ? UIColor.green : UIColor.red;
        Timer.scheduledTimer(withTimeInterval: 0.2, repeats: false){_ in
            self.quiz.nextQuestion();
            self.updateUI();
            sender.backgroundColor = UIColor.clear;
        }
    }

    func updateUI() {
        questionView.text = quiz.getCurrentQuestion().title;
        progressView.progress = quiz.getProgress();
        scoreTracker.text = "Score: \(quiz.score)"
    }
}

