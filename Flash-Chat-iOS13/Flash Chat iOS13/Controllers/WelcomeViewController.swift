//
//  WelcomeViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated);
        self.navigationController?.isNavigationBarHidden = true;
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated);
        self.navigationController?.isNavigationBarHidden = false;
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let titleText = K.appName;
        titleLabel.text = "";
        var timeInterval = 1.0;
        for letter in titleText {
            Timer.scheduledTimer(withTimeInterval: 0.1*timeInterval, repeats: true, block: { timer in
                self.titleLabel.text?.append(letter);
                timer.invalidate();
            })
            timeInterval += 0.5;
        }
    }
}
