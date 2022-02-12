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
    
    func validateUserName (username: String){
        
        if username == "" {}
    }
}

/*struct SignUp_Previews: PreviewProvider {
    static var previews: some View {
        SignUp()
    }
}*/
