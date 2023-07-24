//
//  CoinManager.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

protocol CoinManagerDelegate {
    func didFetchData(_ data: CoinData)
    func didFetchWithError(_ error: Error)
}

struct CoinManager {
    var delegate: CoinManagerDelegate?
    let apiKey = "A46F3598-5A02-459D-BDA8-BE0810AA42F4"
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC"
    
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
    
    func fetchCoinData(_ currency: String) {
        performRequest("\(self.baseURL)/\(currency)?apiKey=\(self.apiKey)")
    }
    
    func performRequest(_ urlString: String){
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default);
            let task = session.dataTask(with: url, completionHandler: { data, _, error in
                if let err = error {
                    self.delegate?.didFetchWithError(err);
                    return
                }
                
                if let safeData = data {
                    if let coinData: CoinData = self.parseData(data: safeData) {
                        self.delegate?.didFetchData(coinData);
                    }
                }
            })
            task.resume();
        }
    }
    
    func parseData(data: Data) -> CoinData? {
        let decoder = JSONDecoder()
        do {
            let coinModel = try decoder.decode(CoinModel.self, from: data)
            let coinData = CoinData(rate: coinModel.rate , currency: coinModel.asset_id_quote)
            return coinData;
        } catch {
            self.delegate?.didFetchWithError(error);
            return nil;
        }
    }
}
