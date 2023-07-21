//
//  Sotry.swift
//  Destini-iOS13
//
//  Created by Angela Yu on 08/08/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

struct Story {
    var question: String = ""
    var options: [String] = []
    init(question: String, option1: String, option2: String){
        self.question = question;
        self.options.append(option1);
        self.options.append(option2);
    }
}
