//
//  DataManager.swift
//  Delphi
//
//  Created by Manuel Carvalho on 17/1/22.
//

import Foundation


protocol  FedResDataManagerDelegate {
    func didUpdateFedRes(prices: [String: Any])
}

struct DataManager {
    
    let treasuryURL = "https://api.fiscaldata.treasury" + ".gov/services/api/fiscal_service/v1/accounting/od/rates_of_exchange?fields" + "=country_currency_desc,exchange_rate," + "record_date&filter=record_date:gte:2015-01-01"
    
    
    let fedResURL = "https://api.fiscaldata.treasury.gov/services/api/fiscal_service/v1/accounting/od/rates_of_exchange?fields=country_currency_desc, exchange_rate,record_date&filter=country_currency_desc:in:(Canada-Dollar,Mexico-Peso), record_date:gte:2022-01-26"
    
    var delegate: FedResDataManagerDelegate?
    
    func fetchFedResData(){
       
        performRequest(urlString: treasuryURL)
        //getData(urlString: data1)
    }
    
    
    func performRequest(urlString: String){
        print("performRequest")
        
        if let url = URL(string: urlString){
            
            
            let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
            //let task = session.dataTask(with: url) { (data, response, error) in
                //print("Task")
                if error != nil {
                    print(error!)
                    return
                }
                
                print("raw data")
                //print(String(data: data!, encoding: .utf8)!)
                if let safeData = data {
                    self.parseJSON(fedResData: safeData)
                    //parseJSON(fedResData: safeData)
                }
            }
            
            
            task.resume()
        }
        
    }
    
    func parseJSON(fedResData: Data){
        print("parseJSON")
        do {
            if let json = try JSONSerialization.jsonObject(with: fedResData, options: []) as? [String: Any] {
                // try to read out a string array
                if let values = json["data"] as? [String: Any] {
                    print("values")
                    self.delegate?.didUpdateFedRes(prices: values)
                }
            }
        } catch let error as NSError {
            print("Failed to load: \(error.localizedDescription)")
        }

    }
    
    
}


//let task = URLSession.shared.dataTask(with: url as URL) {(data, response, error) in
