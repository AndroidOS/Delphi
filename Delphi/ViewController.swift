//
//  ViewController.swift
//  Delphi
//
//  Created by Manuel Carvalho on 15/1/22.
//

import UIKit

class ViewController: UIViewController, FedResDataManagerDelegate,  UITableViewDelegate, UITableViewDataSource  {
    
    
    @IBOutlet weak var tableview: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
    
    
    func didUpdateFedRes(prices: [Forex]) {
        print(prices)
    }
    
    
    var dataManager = DataManager()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        dataManager.delegate = self
        dataManager.fetchFedResData()
        
        print("ViewDidLoad")
    }


    
    
}


