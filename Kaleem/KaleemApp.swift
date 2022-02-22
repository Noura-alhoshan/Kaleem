//
//  KaleemApp.swift
//  Kaleem
//
//  Created by نوره سعد on 21/06/1443 AH.
//

import SwiftUI
import Firebase

@main
struct KaleemApp: App {
    
    init(){
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            Wrraper().environmentObject(SessionStore())
        }
    }
}
