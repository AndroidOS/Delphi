//
//  DetailViewController.swift
//  Delphi
//
//  Created by Manuel Carvalho on 7/3/2022.
//

import UIKit

class DetailViewController: UIViewController {
    
    var modelString:String?
    var numUser = 0

    @IBOutlet weak var lblDisplay: UILabel!
    
    @IBOutlet weak var lblCurrency: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        if let url = modelString {
//            print(modelString ?? "NIL")
//            lblDisplay.text = "\(url)"
//        } else {
//            print("Nil Value")
//            lblDisplay.text = "Nil Value"
//        }
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print(numUser)
        if let url = modelString {
            print(modelString ?? "NIL")
            lblDisplay.text = "\(url)"
        } else {
            print("Nil Value")
            lblDisplay.text = "Nil Value"
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
