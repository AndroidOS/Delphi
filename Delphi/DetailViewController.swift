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
    var numCost = ""

    @IBOutlet weak var lblDisplay: UILabel!
    
    @IBOutlet weak var lblCurrency: UILabel!
    
    @IBOutlet weak var btn_share: UIBarButtonItem!
    
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
        
        lblCurrency.text = numCost
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func btnShareDetail(_ sender: Any) {
        
        // text to share
                var text = ""
        
                if let url = modelString {
                    text = url
            
                }
               
               // set up activity view controller
               let textToShare = [ text ]
               let activityViewController = UIActivityViewController(activityItems: textToShare, applicationActivities: nil)
               activityViewController.popoverPresentationController?.sourceView = self.view // so that iPads won't crash
               
//               // exclude some activity types from the list (optional)
//               activityViewController.excludedActivityTypes = [ UIActivity.ActivityType.airDrop, UIActivity.ActivityType.postToFacebook ]
//               
               // present the view controller
               self.present(activityViewController, animated: true, completion: nil)
    }
}
