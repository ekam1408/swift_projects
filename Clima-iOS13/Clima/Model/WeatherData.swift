//
//  WeatherData.swift
//  Clima
//
//  Created by Ekambeer Singh on 24/07/23.
//  Copyright © 2023 App Brewery. All rights reserved.
//

import Foundation

struct Main: Decodable {
    let temp: Double
}

struct Weather: Decodable {
    let id: Int
}

struct WeatherData: Decodable {
    let name: String
    let main: Main
    let weather: [Weather]
}
