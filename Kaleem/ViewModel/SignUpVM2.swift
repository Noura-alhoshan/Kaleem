import Foundation
import SwiftUI
import Firebase
import Combine



class SignUpVM : ObservableObject {
    var email: String
    init() {
        self.email = ""
    }
    init(email: String) {
        self.email = email
    }

    
    let auth = Auth.auth()
    let db = Firestore.firestore()
    
    
    // create user in Firebase Auth.
    func createNewAccount(email: String, password: String, userType: String, username: String, phone: String, accStatus: String) { // I change it because it was display an error (var > String) ########
        
        auth.createUser(withEmail: email, password: password){ result, err in
            if let err = err {
                print ("PASSWORD IN VM: \(password)")
                print("Failed to create user:", err)
                return
            }

            print("Successfully created user: \(result?.user.uid ?? "")")

            self.addDataToCollection(userType: userType, username: username, phone: phone, email: email, accStatus: accStatus)        }
    } // END crrate user
    
     func addDataToCollection(userType: String, username: String, phone: String, email: String, accStatus: String) {
        
         guard let uid = Auth.auth().currentUser?.uid else {
             print ("Get FAILED!!!!!!!!!!!!!!!!!!!!!!111")
             return }
         print(uid)
        // Add a document to a collection
       //  db.collection(/*userType*/"Volunteer").addDocument(data: ["uid":uid/*, "username":username, "phoneNo":phone, "email":email*/])
         // Add a document to a collection

         if (userType == "Speech-impaired"){
         db.collection(userType).document(uid).setData(["uid":uid,
                                                        "name":username, "phoneNo":phone, "email":email, "type": "Impaired"
          ])         { error in
            
            // Check for errors
            if error == nil {
                // No errors
            }
            else {
                // Handle the error
            }
        }
     }
         else{
             print("AccountStatus#### \(accStatus)")
             db.collection(userType).document(uid).setData(["uid":uid,
                                                            "name":username, "phoneNo":phone, "email":email, "type": userType,
                                                            "accStatus" : accStatus
              ])         { error in
                
                // Check for errors
                if error == nil {
                    // No errors
                }
                else {
                    // Handle the error
                }
            }
             
         }
    }
   /*
    // create user in Firebase Auth.
    func createNewAccount(email: String, password: String) -> String{ // I change it because it was display an error (var > String) ########
        var uid = ""
        auth.createUser(withEmail: email, password: password){ result, err in
            if let err = err {
             //   print( err.localizedDescription)
                return
            }
            uid = result?.user.uid ?? "NULL1234"
            print("Successfully created user: \(result?.user.uid ?? "")")
        }
        return uid
    } // END crrate user
    
    func addDataToCollection(uid: String, userType: String, username: String, phone: String, email: String) {
        
        

        
        // Add a document to a collection
         db.collection(userType).document(uid).setData([
            "username":username, "phoneNo":phone, "email":email
         ]) { error in
            
            // Check for errors
            if error == nil {
                // No errors
            }
            else {
                // Handle the error
            }
        }
    }*/
    func validateUserName (username: String) -> String {
        var err = ""
        if username == "" {
            err = "*الاسم الكامل مطلوب"
        }else if !username.containsOnlyLetters { // .containsOnlyLetters
            err = "*يجب أن يكون الاسم أحرف فقط"
        } else if username.count < 3 {
            err = "*يجب أن يكون ٣ أحرف على الأقل"
        }else if username.count > 20 {
            err = "*يجب أن يكون ٢٠ حرفا على الأكثر"
        }
        return err
    }
    
    func validatePhoneNo (phone: String)-> String {
        var err = ""
        if phone == "" {
            err = "*رقم الجوال مطلوب"
        } else if !phone.validPhone {
            err = "* رقم الجوال يجب أن يبدأ بـ ٠٥ ويتكون من ١٠ خانات"
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
 
        print(err) // =======
        return err
    }
    
    func isEmailExisted(handler: @escaping (Bool, String) -> Void) {
        var isFound2 = false
        if (self.email ).isValidEmail {
            db.collection("Volunteer").getDocuments { (snapshot, error) in
               if let error = error  {
                   handler(false, error.localizedDescription)
               } else {
                   var isFound = false
                   let allUser = snapshot?.documents
                   for user in (allUser ?? []) {
                       print ("EMAIL======================")
                       let dbEmail = user["email"] as? String ?? ""
                       if dbEmail == (self.email ) {
                           isFound = true
                           isFound2 = true
                       }
                   }
                   if isFound {
                       handler(false, "")
                   }
               } // end else
                
            }
            if (isFound2 == false){
            db.collection("Speech-impaired").getDocuments { (snapshot, error) in
               if let error = error  {
                   handler(false, error.localizedDescription)
               } else {
                   var isFound = false
                   let allUser = snapshot?.documents
                   for user in (allUser ?? []) {
                       let dbEmail = user["email"] as? String ?? ""
                       if dbEmail == (self.email ) {
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
    }
    func validatePass (pass: String) -> String {
        var err = ""
        if pass == "" {
            err = "*كلمة المرور مطلوبة"
        }else if !pass.containsUppercase || !pass.containsNumbers || !pass.containsSpecialCharacters {
            err = "*كلمة المرور يجب أن تحتوي على حرف كبير، حرف صغير، رقم، و رمز"
        }
        else if pass.count < 7  {
            err =
"كلمة المرور يجب أن تتكون من ٨ خانات على الأقل"
//            "كلمة المرور يجب أن تحتوي على حرف كبير"
//            "كلمة المرور يجب أن تحتوي على رقم"
//            "كلمة المرور يجب أن تحتوي على رمز"
       }
        
        return err
    }
    
    func validateRepass (pass: String, repass: String)  -> String {
        
            var err = ""
            if repass == "" {
                err = "*تأكيد كلمة المرور مطلوب"
            }  else if repass != pass {
                err = "*لا يطابق كلمة المرور"
            } else {err = "" }
        
            return err
    }
    
}

