//
//  ViewController.swift
//  Delphi
//
//  Created by Manuel Carvalho on 15/1/22.
//

import UIKit

class ViewController: UIViewController, FedResDataManagerDelegate,  UITableViewDelegate, UITableViewDataSource  {
    
    // Data model: These strings will be the data for the table view cells
        let animals: [String] = ["Horse", "Cow", "Camel", "Sheep", "Goat"]
    
    
    @IBOutlet weak var tableview: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return animals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // create a new cell if needed or reuse an old one
//        let cell:UITableViewCell1 = self.tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier) as UITableViewCell!
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
               // set the text from the data model
        cell.textLabel?.text = self.animals[indexPath.row]
               
        return cell
        
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
        
        // This view controller itself will provide the delegate methods and row data for the table view.
//               tableView.delegate = self
//               tableView.dataSource = self
        
        print("ViewDidLoad")
    }


    
    
}


