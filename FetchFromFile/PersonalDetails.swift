//
//  PersonalDetails.swift
//  FetchFromFile
//
//  Created by Rajat Chaudhary on 18/03/18.
//  Copyright © 2018 Rajat Chaudhary. All rights reserved.
//

import Foundation

class PersonalDetails {
    var firstName: String?
    var secondName: String?
    var phNumber: String?
    var emailID: String?
    var error: String?
    
    init(firstName: String?, secondName: String?, phNumber: String?, emailID: String?, error: String?) {
        self.firstName = firstName
        self.secondName = secondName
        self.phNumber = phNumber
        self.emailID = emailID
        self.error = error
    }
}
