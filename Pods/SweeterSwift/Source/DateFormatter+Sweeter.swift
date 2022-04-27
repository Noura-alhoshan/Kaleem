//
//  DateFormatter+Sweeter.swift
//
//  Created by Yonat Sharon on 2019-02-08.
//

import Foundation

public extension DateFormatter {
    /// Sweeter: Create a new formatter with format string.
    convenience init(format: String, timeZone: TimeZone = .current, locale: String? = nil) {
        self.init()
        dateFormat = format
        self.timeZone = timeZone
        if let locale = locale {
            self.locale = Locale(identifier: locale)
        }
    }
}
