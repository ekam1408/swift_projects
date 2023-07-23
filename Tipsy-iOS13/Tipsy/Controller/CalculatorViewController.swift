//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    var calculator = CalculatorBrain();

    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var splitLabel: UILabel!
    @IBOutlet weak var percentageTip0: UIButton!
    @IBOutlet weak var percentageTip10: UIButton!
    @IBOutlet weak var percentageTip20: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calculator.setTip("10%");
        calculator.setSplit(2)
        calculator.setAmount("0.00")
    }
    
    @IBAction func billAmountChanged(_ sender: UITextField) {
        calculator.setAmount(sender.text ?? "0.00");
    }
    
    @IBAction func onStepperPressed(_ sender: UIStepper) {
        let split = Int(sender.value)
        updateSplitUI(split);
        calculator.setSplit(split)
    }

    @IBAction func tipPercentagePressed(_ sender: UIButton) {
        let tip = sender.currentTitle!;
        calculator.setTip(tip);
        updateTipUI(tip);
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        self.performSegue(withIdentifier: "goToResult", sender: self);
    }
    
    func updateTipUI(_ selectedLabel: String) {
        switch(selectedLabel){
        case percentageTip0.titleLabel!.text!:
            percentageTip0.isSelected = true;
            percentageTip10.isSelected = false;
            percentageTip20.isSelected = false;
        case percentageTip10.titleLabel!.text!:
            percentageTip0.isSelected = false;
            percentageTip10.isSelected = true;
            percentageTip20.isSelected = false;
        case percentageTip20.titleLabel!.text!:
            percentageTip0.isSelected = false;
            percentageTip10.isSelected = false;
            percentageTip20.isSelected = true;
        default:
            print("Error");
        }
    }
    
    func updateSplitUI(_ split: Int){
        splitLabel.text = "\(split)";
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultViewController;
            destinationVC.splitAmount = "\(calculator.calculateSplitAmount())";
            destinationVC.tip = "\(calculator.getTip())";
            destinationVC.split = "\(calculator.getSplit())";
        }
    }
}

