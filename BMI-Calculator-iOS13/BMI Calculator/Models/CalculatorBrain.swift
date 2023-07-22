//
//  BmiBrain.swift
//  BMI Calculator
//
//  Created by Ekambeer Singh on 23/07/23.
//  Copyright © 2023 Angela Yu. All rights reserved.
//

import Foundation

class CalculatorBrain {
private
    var height: Float?;
    var weight: Int?;
public
    func setHeight(_ height: Float) {
        self.height = height;
    }
    func setWeight(_ weight: Float) {
        self.weight = Int(weight);
    }
    func getHeight() -> Float{
        return self.height ?? 1.5;
    }
    func getWeight() -> Int{
        return self.weight ?? 100;
    }
    func getBMI() -> Float {
        return Float(String(format: "%.1f", Float(self.weight ?? 100)/pow(self.height ?? 1.5,2)))!;
    }
}
