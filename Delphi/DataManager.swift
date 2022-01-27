//
//  DataManager.swift
//  Delphi
//
//  Created by Manuel Carvalho on 17/1/22.
//

import Foundation


protocol  FedResDataManagerDelegate {
    func didUpdateFedRes(prices: [String: Double])
}

struct BitcoinDataManager {
    
    let fedResURL = "https://api.fiscaldata.treasury.gov/services/api/fiscal_service/v1/accounting/od/rates_of_exchange?fields=country_currency_desc, exchange_rate,record_date&filter=country_currency_desc:in:(Canada-Dollar,Mexico-Peso), record_date:gte:2022-01-26"
    var delegate: FedResDataManagerDelegate?
    
    func fetchBitcoinData(){
       
        performRequest(urlString: fedResURL)
    }
    
    
    func performRequest(urlString: String){
        
        if let url = URL(string: urlString){
            
            let session = URLSession(configuration: .default)
            
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print(error!)
                    return
                }
                
                if let safeData = data {
                    self.parseJSON(fedResData: safeData)
                }
            }
            
            
            task.resume()
        }
        
    }
    
    func parseJSON(fedResData: Data){
        
        do {
            if let json = try JSONSerialization.jsonObject(with: fedResData, options: []) as? [String: Any] {
                // try to read out a string array
                if let values = json["bpi"] as? [String: Double] {
                    
                    self.delegate?.didUpdateFedRes(prices: values)
                }
            }
        } catch let error as NSError {
            print("Failed to load: \(error.localizedDescription)")
        }

    }
    
    
}

