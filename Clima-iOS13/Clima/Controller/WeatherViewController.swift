//
//  ViewController.swift
//  Clima
//
//  Created by Angela Yu on 01/09/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController, UITextFieldDelegate, WeatherManagerDelegate {
    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var searchInput: UITextField!
    var weatherManager = WeatherManager();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchInput.delegate = self;
        weatherManager.delegate = self;
    }
    
    @IBAction func searchPressed(_ sender: UIButton?) {
        searchInput.endEditing(true);
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchPressed(nil);
        return true;
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != "" {
            textField.placeholder = "Enter location"
            return true;
        }
        textField.placeholder = "Type something here!!"
        return false;
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        weatherManager.fetchWeather(searchInput.text ?? "london");
        textField.text = "";
    }
    
    func didFetchWeather(_ weather: WeatherModel) {
        DispatchQueue.main.async {
            self.temperatureLabel.text = weather.temperatureString;
            self.cityLabel.text = weather.cityName;
            self.conditionImageView.image = UIImage(systemName: weather.conditionName)
        }
    }
    
    func didFailWithError(_ error: Error) {
        print(error);
    }
}
