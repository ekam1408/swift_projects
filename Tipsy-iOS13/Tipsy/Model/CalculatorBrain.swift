//
//  CalculatorBrain.swift
//  Tipsy
//
//  Created by Ekambeer Singh on 23/07/23.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import Foundation

struct CalculatorBrain {
    var amount: String?
    var split: Int?
    var tip: Int?
    mutating func setAmount(_ amount: String) {
        self.amount = String(format: "%.2f", Float(amount) ?? 0.00);
    }
    func getAmount() -> String {
        return self.amount ?? "100.00";
    }
    mutating func setSplit(_ split: Int) {
        self.split = split;
    }
    func getSplit() -> Int {
        return self.split ?? 2;
    }
    mutating func setTip(_ tip: String) {
        var newTip = tip;
        let _ = newTip.popLast();
        self.tip = Int(newTip);
    }
    func getTip() -> Int {
        return self.tip ?? 10;
    }
    func calculateSplitAmount() -> String {
        let tippedAmount = (Float(self.amount ?? "0.00") ?? 100.00)*(0.01*Float(self.tip ?? 10));
        return String(format: "%.2f", Float((Float(self.amount ?? "0.00") ?? 100.00) + tippedAmount)/(Float(self.split ?? 2)));
    }
}
