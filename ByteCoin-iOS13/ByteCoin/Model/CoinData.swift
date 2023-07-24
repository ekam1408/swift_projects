//
//  CoinData.swift
//  ByteCoin
//
//  Created by Ekambeer Singh on 24/07/23.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import UIKit

struct CoinData {
    let rate: Double
    let currency: String
    var rateString: String {
        String(format: "%.2f", rate);
    }
}
