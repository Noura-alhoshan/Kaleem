import Foundation
import SwiftUI
import Firebase
import Combine



class SignUpVM : ObservableObject {
   // var didChange = PassthroughSubject<SignUpVM, Never>()
   // var user: User2? { didSet { self.didChange.send(self) }} // why '?'
    // OR
   // @ObservedObject var user = User2

    let auth = Auth.auth()
    let db = Firestore.firestore()

    // create user in Firebase Auth.
    func createNewAccount(email: String, password: String) { // I change it because it was display an error (var > String) ########

        auth.createUser(withEmail: email, password: password)

    } // END crrate user

     func addDataToCollection(userType: String, username: String, phone: String, email: String) {




        // Add a document to a collection
        db.collection(userType).addDocument(data: ["username":username, "phoneNo":phone, "email":email]) { error in

            // Check for errors
            if error == nil {
                // No errors
            }
            else {
                // Handle the error
            }
        }
    }
    func validateUserName (username: String) -> String {
        var err = ""
        if username == "" {
            err = "*اسم المستخدم مطلوب"
        }else if !username.containsOnlyLetters { // .containsOnlyLetters
            err = "*يجب أن يكون الاسم ٣ أحرف فقط"
        } else if username.count < 3 {
            err = "*يجب أن يكون ٣ أحرف على الأقل"
        }
        return err
    }

    func validateEmail (email: String) -> String {
        var err = ""
        if email == "" {
            err = "*البريد الإلكتروني مطلوب"
        }else if !email.isValidEmail {
            err = "*البريد الإلكتروني غير صحيح"
        }else {err = ""}
        isEmailExisted (email: email, handler: { status, msg in
            if !status {
               err = "البريد الإلكتروني مسجل مسبقا"
            }else {err = ""}
        })
        print(err) // =======
        return err
    }

    func isEmailExisted(email: String, handler: @escaping (Bool, String) -> Void) {
        if (email ).isValidEmail {
            db.collection("Volunteer").getDocuments { (snapshot, error) in
               if let error = error  {
                   handler(false, error.localizedDescription)
               } else {
                   var isFound = false
                   let allUser = snapshot?.documents
                   for user in (allUser ?? []) {
                       print ("EMAIL======================")
                       let email = user["email"] as? String ?? ""
                       if email == (email ) {
                           isFound = true
                       }
                   }
                   if isFound {
                       handler(false, "")
                   }
               } // end else

            }
            db.collection("Deaf").getDocuments { (snapshot, error) in
               if let error = error  {
                   handler(false, error.localizedDescription)
               } else {
                   var isFound = false
                   let allUser = snapshot?.documents
                   for user in (allUser ?? []) {
                       let email = user["email"] as? String ?? ""
                       if email == (email ) {
                           isFound = true
                       }
                   }
                   if isFound {
                       handler(false, "")
                   }
               } // end else

            }
        }
    }
    func validatePass (pass: String) -> String {
        var err = ""
        if pass == "" {
            err = "*كلمة المرور مطلوبة"
        }else if !pass.containsUppercase || !pass.containsNumbers || !pass.containsSpecialCharacters || pass.count < 7 {
            err = "*كلمة المرور يجب أن تحتوي على حرف كبير، حرف صغير، رقم، رمز، و ٨ خانات على الأقل"
        }

        return err
    }

    func validatePhoneNo (phone: String)-> String {
        var err = ""
        if phone == "" {
            err = "*رقم الجوال مطلوب"
        } else if !phone.isPhoneNo {
            err = "* رقم الجوال يجب أن يبدأ بـ ٠٥ ويتكون من ١٠ خانات"
        }
        return err
    }

}

