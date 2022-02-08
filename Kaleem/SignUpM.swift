//
//  SignUpM.swift
//  Kaleem
//
//  Created by Afnan Al-Zuayr on 06/07/1443 AH.
//

import Foundation

class User2 : ObservableObject{
    @Published var uid: String
    @Published var email: String // WHY '?'
    
    @Published var username: String
    @Published var phone: String // NEED Change to number #################
    @Published var userType: String
    

    init(uid: String,  email: String, username: String, phone: String, userType: String) {
        self.uid = uid
        self.email = email
        
        self.username = username
        self.phone = phone
        self.userType = userType
    }
    
    

}
