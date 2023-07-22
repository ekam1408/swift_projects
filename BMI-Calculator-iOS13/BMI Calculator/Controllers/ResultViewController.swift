//
//  ResultViewController.swift
//  BMI Calculator
//
//  Created by Ekambeer Singh on 23/07/23.
//  Copyright © 2023 Angela Yu. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var bmiLabel: UILabel!
    @IBOutlet weak var adviceLabel: UILabel!
    var bmiValue: String = "25.0"
    
    override func viewDidLoad() {
        super.viewDidLoad();
        bmiLabel.text = bmiValue;
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true);
    }
}
