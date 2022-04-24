
/* This is the file where we will retrive volunteers list to make video call*/
import Foundation
import FirebaseFirestore

class VideoCallVM: ObservableObject {

    @Published var list = [Volunteer]()

    private var db = Firestore.firestore()

    func getData() {
        db.collection("Volunteer").addSnapshotListener { (querySnapshot, error) in
            guard let documents = querySnapshot?.documents else {
                print("No documents")
                return
            }

            self.list = documents.map { (queryDocumentSnapshot) -> Volunteer in
                let data = queryDocumentSnapshot.data()
                let name = data ["name"] as? String ?? "" 
                let phoneNo = data["phoneNo"] as? String ?? ""
                let gender = data["gender"] as? String ?? ""
                return Volunteer(name: name, phoneNo: phoneNo, gender: gender)
            }
        }
    }
}


