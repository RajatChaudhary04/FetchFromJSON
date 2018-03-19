//
//  JSONdataFetch.swift
//  FetchFromFile
//
//  Created by Rajat Chaudhary on 18/03/18.
//  Copyright © 2018 Rajat Chaudhary. All rights reserved.
//

import Foundation

enum UserDetails {
    case personalDetails(PersonalDetails)
    case connectionDetails(ConnectionDetails)
}

struct JSONdataFetch {
 
    func fetchDataFromCollection(complition: @escaping (UserDetails) -> Void) {
        if let path = Bundle.main.path(forResource: "collection", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let results = try JSONSerialization.jsonObject(with: data, options: []) as? [String:Any]
                
                if let userPersonalData = results!["data"] as? [String: Any] {
                    let userData = fetchUserDetails(with: userPersonalData)
                    complition(userData)
                }
                
                if let connectionData = results!["included"] as? [[String: Any]] {
                    let connection = fetchConnectionDetails(with: connectionData)
                    complition(connection)
                }
            }
            catch {
                print("Error while fetching")
            }
        }
    }
    
    func fetchUserDetails(with json: [String:Any]) -> UserDetails {
        if let attributes = json["attributes"] as? [String: Any] {
            let firstName = attributes["first-name"] as? String
            let secondName = attributes["last-name"] as? String
            let phNumber = attributes["contact-number"] as? String
            let emailID = attributes["email-address"] as? String
            
            return UserDetails.personalDetails(PersonalDetails(firstName: firstName, secondName: secondName, phNumber: phNumber, emailID: emailID, error: nil))
        }
        else {
            return UserDetails.personalDetails(PersonalDetails(firstName: nil, secondName: nil, phNumber: nil, emailID: nil, error: "error"))
        }
    }
    
    func fetchConnectionDetails(with json: [[String:Any]]) -> UserDetails {
        
        var adaptedPlanAvailableCredit: Int?
        var adaptedPlanExp: String?
        var currentPlanCredit: Int?
        var currentPlanExp: String?
        var relatedPlanPrice: Int?
        var relatedPlanName: String?
        
            let fetchedValue0 = json[0]
        if let valueForAdapted = fetchedValue0["attributes"] as? [String:Any] {
                adaptedPlanExp = (valueForAdapted["credit-expiry"] as? String)!
//                print(adaptedPlanExp)
                adaptedPlanAvailableCredit = (valueForAdapted["credit"] as? Int)!
        }
        
            let fetchedValue1 = json[1]
        if let valueForPlan = fetchedValue1["attributes"] as? [String:Any] {
                currentPlanCredit = (valueForPlan["included-data-balance"] as? Int)!
                currentPlanExp = (valueForPlan["expiry-date"] as? String)!
        }
            let fetchedValue2 = json[2]
        if let valueForRelated = fetchedValue2["attributes"] as? [String:Any] {
                relatedPlanName = (valueForRelated["name"] as? String)!
                relatedPlanPrice = (valueForRelated["price"] as? Int)!
            }
            return UserDetails.connectionDetails(ConnectionDetails(adaptedPlanAvailableCredit: adaptedPlanAvailableCredit, adaptedPlanExp: adaptedPlanExp, currentPlanCredit: currentPlanCredit, currentPlanExp: currentPlanExp, relatedPlanPrice: relatedPlanPrice, relatedPlanName: relatedPlanName, error: nil))
    }
}
