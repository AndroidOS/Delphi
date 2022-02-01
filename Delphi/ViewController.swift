//
//  ViewController.swift
//  Delphi
//
//  Created by Manuel Carvalho on 15/1/22.
//

import UIKit

class ViewController: UIViewController, FedResDataManagerDelegate {
    
    var dataManager = DataManager()
    
    func didUpdateFedRes(prices: [String : Double]) {
        print("didUpdateFedRes")
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        dataManager.delegate = self
        dataManager.fetchFedResData()
        
        print("ViewDidLoad")
    }


    
    
}


