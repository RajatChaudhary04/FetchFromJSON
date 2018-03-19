//
//  TableViewController.swift
//  FetchFromFile
//
//  Created by Rajat Chaudhary on 19/03/18.
//  Copyright © 2018 Rajat Chaudhary. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    var conDict = [String:String]()
    var arryConDetails = ["adaptedPlanAvailableCredit", "adaptedPlanExp", "currentPlanCredit", "currentPlanExp", "relatedPlanName", "relatedPlanPrice"]

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        let key = arryConDetails[indexPath.row]
        cell.textLabel?.text = conDict[key] as? String
        cell.detailTextLabel?.text = key
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return conDict.count
    }
}
