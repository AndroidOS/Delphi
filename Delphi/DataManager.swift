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

struct DataManager {
    
    let data1 = "https://api.fiscaldata.treasury.gov/services/api/fiscal_service/v1/accounting/od/rates_of_exchange?fields=country_currency_desc,exchange_rate, record_date&filter=record_date:gte:2015-01-01"
    
    let fedResURL = "https://api.fiscaldata.treasury.gov/services/api/fiscal_service/v1/accounting/od/rates_of_exchange?fields=country_currency_desc, exchange_rate,record_date&filter=country_currency_desc:in:(Canada-Dollar,Mexico-Peso), record_date:gte:2022-01-26"
    var delegate: FedResDataManagerDelegate?
    
    func fetchFedResData(){
       
        //performRequest(urlString: data1)
        getData(urlString: data1)
    }
    
    
    func performRequest(urlString: String){
        print("performRequest")
        
        if let url = URL(string: urlString){
            
            let session = URLSession(configuration: .default)
            let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
            //let task = session.dataTask(with: url) { (data, response, error) in
                print("Task")
                if error != nil {
                    print(error!)
                    return
                }
                
                print(data)
                if let safeData = data {
                    self.parseJSON(fedResData: safeData)
                }
            }
            
            
            task.resume()
        }
        
    }
    
    func parseJSON(fedResData: Data){
        print(fedResData)
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
    
    


func getData(urlString: String){
    
    let c = "https://api.fiscaldata.treasury" + ".gov/services/api/fiscal_service/v1/accounting/od/rates_of_exchange?fields" + "=country_currency_desc,exchange_rate," + "record_date&filter=record_date:gte:2015-01-01"
    
    let data1: String = "https://api.fiscaldata.treasury.gov/services/api/fiscal_service/v1/accounting/od/rates_of_exchange?fields=country_currency_desc,exchange_rate, record_date&filter=record_date:gte:2015-01-01"
    
    print(urlString)
    let url = URL(string: c)!
    //let url: NSURL = NSURL(string: data1)!

    let task = URLSession.shared.dataTask(with: url as URL) {(data, response, error) in
        guard let data = data else { return }
        print(String(data: data, encoding: .utf8)!)
    }

    task.resume()
    }

}
