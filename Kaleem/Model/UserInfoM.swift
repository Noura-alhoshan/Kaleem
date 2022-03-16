//
//  UserInfoM.swift
//  Kaleem
//
//  Created by Sarah S on 16/03/2022.
//

import SwiftUI
import Foundation

struct UserInfo : Identifiable {
    var id : String = UUID().uuidString
    var name : String /*WE NEED TO CHANGE IT TO NAME!*/
    var phoneNo : String
    var email: String
    var type: String
}
