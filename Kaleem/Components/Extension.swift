
import SwiftUI
import Foundation



extension Color {
    
}

extension String {
   
    var isValidEmail: Bool {
        let dataDetector = try? NSDataDetector(types: NSTextCheckingResult.CheckingType.link.rawValue)
        let firstMatch = dataDetector?.firstMatch(in: self, options: NSRegularExpression.MatchingOptions.reportCompletion, range: NSRange(location: 0, length: self.count))
        return (firstMatch?.range.location != NSNotFound && firstMatch?.url?.scheme == "mailto")
    }
    
    var containsSpecialCharacters: Bool {
        do {
            let regex = try NSRegularExpression(pattern: "[^a-z0-9 ]", options: .caseInsensitive)
            if let _ = regex.firstMatch(in: self, options: [], range: NSMakeRange(0, self.count)) {
                return true
            } else {
                return false
            }
        } catch {
            debugPrint(error.localizedDescription)
            return false
        }
    }
    
    var containsUppercase: Bool {
        let texttest = NSPredicate(format: "SELF MATCHES %@", ".*[A-Z]+.*")
        return texttest.evaluate(with: self)
    }
    
    
    var containsNumbers: Bool {
        let testCase = NSPredicate(format: "SELF MATCHES %@", ".*[0-9]+.*")
        return testCase.evaluate(with: self)
    }
    
    var isValidPassword: Bool {
        let passwordRegex = "^(?=.*\\d)(?=.*[a-z])(?=.*[A-Z])[0-9a-zA-Z!@#$%^&*()\\-_=+{}|?>.<,:;~`’]{10,}$"
        return NSPredicate(format: "SELF MATCHES %@", passwordRegex).evaluate(with: self)
    }
    
    func toJSON() -> [String:Any]? {
        guard let data = self.data(using: .utf8, allowLossyConversion: false) else { return nil }
        return try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String:Any]
    }
                
    /// This variable is String variable that return only aplha charcter and remove all other character form current string
    var alphaCharcter: String {
        return String(self.filter { AcceptCharacter.nameletter.contains($0) })
    }
    
    /// This variable is String variable that return only number charcter and remove all other character form current string
    var numberCharcter: String {
        return String(self.filter { AcceptCharacter.numberLetter.contains($0) })
    }
    
    var aplhaNumberLetter: String {
        return String(self.filter { AcceptCharacter.aplhaNumberLetter.contains($0) })
    }
    
    
    /// This variable is String variable that return only phone number charcter and remove all other character form current string
    var phoneCharcter: String {
        return String(self.filter { AcceptCharacter.phoneLetter.contains($0) })
    }

    func index(from: Int) -> Index {
        return self.index(startIndex, offsetBy: from)
    }

    var containsOnlyLetters: Bool {
        for chr in self {
          if (!(chr >= "a" && chr <= "z") && !(chr >= "A" && chr <= "Z")) && chr != " " {
             return false
          }
       }
       return true
    }
    
    var customSubstring: String {
        let str = self
        let reqIndex = str.index(str.startIndex, offsetBy: 3)
        let finalStr = String(str[..<reqIndex])
        return finalStr
    }
       
    var validPhone: Bool {
        //let PHONE_REGEX = "^\\d{3}-\\d{3}-\\d{4}$"
        let PHONE_REGEX2 = "^(9665|05)(5|0|3|6|4|9|1|8|7)\\d{7}$"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", PHONE_REGEX2)
        let result = phoneTest.evaluate(with: self)
        return result
            }
    
    // another way to validate phone with the next three function togather
    var KSAPhoneKey: Bool {
        let PHONE_REGEX2 = "^(009665|9665|05|5)"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", PHONE_REGEX2)
        let result = phoneTest.evaluate(with: self)
        return result
            }
    var phoneCompany: Bool {
        let PHONE_REGEX2 = "(5|0|3|6|4|9|1|8|7)"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", PHONE_REGEX2)
        let result = phoneTest.evaluate(with: self)
        return result
            }
    
    var anySevenDigits: Bool {
        let PHONE_REGEX2 = "\\d{7}$"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", PHONE_REGEX2)
        let result = phoneTest.evaluate(with: self)
        return result
            }
}
