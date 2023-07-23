//
//  ResultViewController.swift
//  Tipsy
//
//  Created by Ekambeer Singh on 23/07/23.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    var splitAmount: String?
    var tip: String?
    var split: String?
    @IBOutlet weak var splitDescriptionLabel: UILabel!
    @IBOutlet weak var amountLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        amountLabel.text = splitAmount;
        splitDescriptionLabel.text = "Split between \(split ?? "2") people, with \(tip ?? "10")% tip."
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true);
    }
}
