//
//  StoryBrain.swift
//  Destini-iOS13
//
//  Created by Angela Yu on 08/08/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation


struct StoryBrain {
    var stories: [Story] = [Story(question: "You see a fork in the road", option1: "Take a left.", option2: "Take a right."), Story(question: "You see a tiger.", option1: "Shout for help.", option2: "Play dead."), Story(question: "You find a treasure chest.", option1: "Open it.", option2: "Check for traps.")];
    var storyNumber = 0;
    mutating func nextStory() {
        if self.storyNumber < stories.count - 1 {
            self.storyNumber += 1;
        } else {
            self.storyNumber = 0;
        }
    }
    func getCurrentStory() -> Story {
        return self.stories[self.storyNumber];
    }
}
