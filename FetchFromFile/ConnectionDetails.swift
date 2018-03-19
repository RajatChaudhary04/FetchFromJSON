//
//  ConnectionDetails.swift
//  FetchFromFile
//
//  Created by Rajat Chaudhary on 18/03/18.
//  Copyright © 2018 Rajat Chaudhary. All rights reserved.
//

import Foundation

class ConnectionDetails {
    let adaptedPlanAvailableCredit: Int?
    let adaptedPlanExp: String?
    let currentPlanCredit: Int?
    let currentPlanExp: String?
    let relatedPlanPrice: Int?
    let relatedPlanName: String?
    let error: String?
    
    init( adaptedPlanAvailableCredit: Int?,  adaptedPlanExp: String?,  currentPlanCredit: Int?,  currentPlanExp: String?,  relatedPlanPrice: Int?,  relatedPlanName: String?, error: String?) {
        self.adaptedPlanAvailableCredit = adaptedPlanAvailableCredit
        self.adaptedPlanExp = adaptedPlanExp
        self.currentPlanExp = currentPlanExp
        self.currentPlanCredit = currentPlanCredit
        self.relatedPlanPrice = relatedPlanPrice
        self.relatedPlanName = relatedPlanName
        self.error = error
    }
}
