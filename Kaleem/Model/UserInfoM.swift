//
//  VolunteerM.swift
//  Kaleem
//
//  Created by Afnan Al-Zuayr on 24/07/1443 AH.
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
