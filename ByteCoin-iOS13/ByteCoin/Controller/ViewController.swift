//
//  ViewController.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var selectedCurrency: UIPickerView!
    var coinManager = CoinManager();

    @IBOutlet weak var rateLabel: UILabel!
    override func viewDidLoad() {
        selectedCurrency.dataSource = self;
        selectedCurrency.delegate = self;
        coinManager.delegate = self;
        coinManager.fetchCoinData(coinManager.currencyArray[0]);
        super.viewDidLoad()
    }
}

//MARK: - UIPickerViewDataSource

extension ViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1;
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return coinManager.currencyArray.count;
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return coinManager.currencyArray[row];
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        coinManager.fetchCoinData(coinManager.currencyArray[row]);
    }
}

//MARK: - CoinManagerDelegate

extension ViewController: CoinManagerDelegate  {
    func didFetchData(_ data: CoinData) {
        DispatchQueue.main.async {
            self.rateLabel.text = data.rateString;
        }
    }
    
    func didFetchWithError(_ error: Error) {
        print(error);
    }
}
