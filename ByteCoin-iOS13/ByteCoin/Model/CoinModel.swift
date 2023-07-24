//
//  CoinModel.swift
//  ByteCoin
//
//  Created by Ekambeer Singh on 24/07/23.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import Foundation

struct CoinModel: Decodable {
    let rate: Double
    let asset_id_quote: String
}
