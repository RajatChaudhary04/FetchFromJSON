//
//  ViewController.swift
//  FetchFromFile
//
//  Created by Rajat Chaudhary on 18/03/18.
//  Copyright © 2018 Rajat Chaudhary. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var resultLabel: UILabel!
    @IBOutlet var nameTextFiled: UITextField!
    @IBOutlet var emailIDTextFiled: UITextField!
    @IBOutlet var phNumberTextFiled: UITextField!
    let fetchData = JSONdataFetch()
    var tableViewObj = TableViewController()
    
    var firstName: String?
    var phNumber: String?
    var emailID: String?
    
    var conDict = [String:String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData.fetchDataFromCollection { (userDetails) in
            
            switch userDetails {
            case let .personalDetails(perDetails):
                self.fetchPersonaldetails(with: perDetails)
            case let .connectionDetails(conDetails):
                self.fetchConnectionDetails(with: conDetails)
            }
        }
    }
    
    func fetchPersonaldetails(with from: PersonalDetails) {
        firstName = from.firstName
        phNumber = from.phNumber
        emailID = from.emailID
    }
    
    func fetchConnectionDetails(with from: ConnectionDetails) {
        conDict["adaptedPlanAvailableCredit"] = String(describing: from.adaptedPlanAvailableCredit!)
        conDict["adaptedPlanExp"] = from.adaptedPlanExp
        conDict["currentPlanCredit"] = String(describing: from.currentPlanCredit!)
        conDict["currentPlanExp"] = from.currentPlanExp
        conDict["relatedPlanName"] = from.relatedPlanName
        conDict["relatedPlanPrice"] = String(describing: from.relatedPlanPrice!)
    }

    @IBAction func logInButton(_ sender: Any) {
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if nameTextFiled.text == firstName && emailIDTextFiled.text == emailID && phNumberTextFiled.text == phNumber {
    
        switch segue.identifier {
        case "someID"?:
            tableViewObj = segue.destination as! TableViewController
            tableViewObj.conDict = self.conDict
        default:
            print("error")
            }
        }
    }
}

