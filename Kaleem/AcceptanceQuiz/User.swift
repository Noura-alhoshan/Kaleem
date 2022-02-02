//
//  User.swift
//  Kaleem
//
//  Created by نوره سعد on 27/06/1443 AH.
//

import Foundation
 
struct User: Identifiable {
    var id: String = UUID().uuidString
    var name: String
    var surname: String
}
