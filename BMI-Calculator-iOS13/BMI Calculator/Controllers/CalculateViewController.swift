//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {
    var calculator = CalculatorBrain();

    @IBOutlet weak var heightText: UILabel!
    @IBOutlet weak var weightText: UILabel!
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad();
        calculator.setHeight(Float(String(format: "%.2f", heightSlider.value))!);
        calculator.setWeight(weightSlider.value);
    }

    @IBAction func heightChanged(_ sender: UISlider) {
        calculator.setHeight(Float(String(format: "%.2f", sender.value))!);
        updateHeightUI();
    }
    
    @IBAction func weightChanged(_ sender: UISlider) {
        calculator.setWeight(sender.value);
        updateWeightUI();
    }
    
    func updateWeightUI(){
        weightText.text = "\(calculator.getWeight())Kg";
    }
    func updateHeightUI(){
        heightText.text = "\(calculator.getHeight())m";
    }
    @IBAction func calculatePressed(_ sender: UIButton) {
        self.performSegue(withIdentifier: "goToResult", sender: self);
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultViewController;
            destinationVC.bmiValue = "\(calculator.getBMI())";
        }
    }
}

