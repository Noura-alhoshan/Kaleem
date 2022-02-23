//
//  Color.swift
//  Kaleem
//
//  Created by Sarah S on 22/07/1443 AH.
//

import UIKit
import SwiftUI

extension UIColor {
    
    static let flatDarkBackground = UIColor(red: 36, green: 36, blue: 36)
    static let flatDarkCardBackground = UIColor(red: 46, green: 46, blue: 46)
    
    convenience init(red: Int, green: Int, blue: Int, a: CGFloat = 1.0) {
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: a)
    }
}

//extension Color {
//    public init(decimalRed red: Double, green: Double, blue: Double) {
//        self.init(red: red / 255, green: green / 255, blue: blue / 255)
//    }
//
//    public static var flatDarkBackground: Color {
//        return Color(decimalRed: 36, green: 36, blue: 36)
//    }
//
//    public static var flatDarkCardBackground: Color {
//        return Color(decimalRed: 46, green: 46, blue: 46)
//    }
//}

extension Color {
    static let textColor = Color(red: 235 / 255, green: 235 / 255, blue: 235 / 255)
    static let subtextColor = Color(red: 199 / 255, green: 199 / 255, blue: 199 / 255)
   
        static let pinkColor = Color(red: 227 / 255, green: 133 / 255, blue: 180 / 255)
        static let purpleColor = Color(red: 123 / 255, green: 119 / 255, blue: 233 / 255)
        static let OrangeColor = Color(red: 240 / 255, green: 146 / 255, blue: 171 / 255)
}
