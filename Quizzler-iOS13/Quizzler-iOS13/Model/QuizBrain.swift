//
//  questions.swift
//  Quizzler-iOS13
//
//  Created by Ekambeer Singh on 21/07/23.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import Foundation

struct QuizBrain {
    let questions: [Question] = [Question(title: "Hello", answer: true), Question(title: "Hello2", answer: true), Question(title: "Hello3", answer: false)];
    var questionNumber = 0;
    var score = 0;
    
    func getCurrentQuestion() -> Question {
        return self.questions[self.questionNumber];
    }
    
    mutating func nextQuestion() {
        if self.questionNumber < self.questions.count - 1 {
            self.questionNumber += 1;
        } else {
            self.score = 0;
            self.questionNumber = 0;
        }
    }
    
    mutating func incrementScore() {
        self.score += 1;
    }
    
    mutating func verifyAnswer(_ userAnswer: Bool) -> Bool{
        if userAnswer == self.questions[self.questionNumber].answer {
            self.incrementScore();
            return true;
        }
        return false;
    }
    
    func getProgress() -> Float {
        return Float(self.questionNumber + 1)/Float(self.questions.count);
    }
}
