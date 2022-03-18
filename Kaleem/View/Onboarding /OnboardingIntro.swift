//
//  OnboardingIntro.swift
//  Kaleem
//
//  Created by Raneem AlRashoud on 11/07/1443 AH.
//

import SwiftUI

struct Intro: Identifiable{
    var id = UUID().uuidString
    var title: String
    var subTitle: String
    var description: String
    var pic: String
    var color: Color
    var offset: CGSize = .zero
     
}
