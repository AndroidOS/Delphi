//
//  ViewController.swift
//  Delphi
//
//  Created by Manuel Carvalho on 15/1/22.
//

import UIKit

class ViewController: UIViewController, FedResDataManagerDelegate,  UITableViewDelegate, UITableViewDataSource  {
    
    @IBOutlet weak var Download: UIBarButtonItem!
    var modelArray  = [Forex]()
    var currencyArray = [String]()
    var touchIndex = 0
    var currencyString = ""
    var currencyAmount = ""
    
    // Data model: These strings will be the data for the table view cells
        let animals: [String] = ["Horse", "Cow", "Camel", "Sheep", "Goat"]
    
    
    @IBOutlet weak var tableview: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return animals.count
        //return modelArray.count
        return currencyArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // create a new cell if needed or reuse an old one
//        let cell:UITableViewCell1 = self.tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier) as UITableViewCell!
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
               // set the text from the data model
        //cell.textLabel?.text = self.animals[indexPath.row]
        
//        cell.textLabel?.text = self.modelArray[indexPath.row].currency
        cell.textLabel?.text = self.currencyArray[indexPath.row]
               
        return cell
        
    }
    
    
    
    func didUpdateFedRes(prices: [Forex]) {
        print(prices)
        modelArray = prices
        
        findUniqueCurrency()
        
        DispatchQueue.main.async {
            self.modelArray = prices
            //self.tableView.reloadData()
            self.tableview.reloadData()
        }
    }
    
    
    var dataManager = DataManager()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        dataManager.delegate = self
        dataManager.fetchFedResData()
        
        
        print("ViewDidLoad")
    }
    
    
    func    findUniqueCurrency(){
        
        for forex in modelArray {
            
            let cleanCurrency = forex.currency.replacingOccurrences(of: "\"", with: "")
            
            if !currencyArray.contains(cleanCurrency){
                currencyArray.append(cleanCurrency)
            }
        }
        
        print(currencyArray)
    }
    
   
    
    // method to run when table view cell is tapped
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            print("You tapped cell number \(indexPath.row).")
            currencyString = currencyArray[indexPath.row]
            currencyAmount = modelArray[indexPath.row].value
            self.performSegue(withIdentifier: "detail", sender: nil)
        }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detail" {
                if let detailViewController = segue.destination as? DetailViewController {
                    detailViewController.modelString = currencyString
                    detailViewController.numUser = touchIndex
                    detailViewController.numCost = currencyAmount
                    print("Prepare for segue")
//                        nextViewController.valueOfxyz = "XYZ" //Or pass any values
//                        nextViewController.valueOf123 = 123
                }
            }
    }

    
    
}


