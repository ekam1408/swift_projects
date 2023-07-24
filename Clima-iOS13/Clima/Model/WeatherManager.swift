//
//  WeatherManager.swift
//  Clima
//
//  Created by Ekambeer Singh on 24/07/23.
//  Copyright © 2023 App Brewery. All rights reserved.
//

import UIKit
import CoreLocation

protocol WeatherManagerDelegate {
    func didFetchWeather(_ weather: WeatherModel);
    func didFailWithError(_ error: Error);
}

struct WeatherManager {
    var delegate: WeatherManagerDelegate?
    let url: String = "https://api.openweathermap.org/data/2.5/weather?appid=aa79db377abbba2acc7f8601da24b62c&units=metric"
    
    func fetchWeather(_ place: String) {
        performRequest("\(self.url)&q=\(place)")
    }
    
    func fetchWeather(with lat: CLLocationDegrees, lon: CLLocationDegrees) {
        performRequest("\(self.url)&lat=\(lat)&lon=\(lon)")
    }
    
    func performRequest(_ urlString: String){
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default);
            let task = session.dataTask(with: url) { (data, _, error) in
                if let err = error {
                    self.delegate?.didFailWithError(err);
                    return
                }
                if let safeData = data {
                    if let weatherData = self.parser(data: safeData){
                        self.delegate?.didFetchWeather(weatherData);
                    }
                }
            }
            
            task.resume();
        }
    }
    
    func parser(data: Data) -> WeatherModel? {
        let decoder = JSONDecoder();
        do {
            let decodedData = try decoder.decode(WeatherData.self, from: data)
            let id = decodedData.weather[0].id;
            let temp = decodedData.main.temp;
            let name = decodedData.name;
            
            let weatherModel = WeatherModel(conditionId: id, cityName: name, temperature: temp)
            
            return weatherModel
        } catch {
            delegate?.didFailWithError(error);
            return nil
        }
        
    }
}


