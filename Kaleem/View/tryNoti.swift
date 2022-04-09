import Foundation
import FirebaseFirestore

class VideoCallVM2: ObservableObject {

    var playerIDs = [String]()
    
    private var db = Firestore.firestore()

    func fetchData() {
        
        Firestore
          .firestore()
          .collection("Volunteer")
          .getDocuments { (snapshot, error) in
             guard let snapshot = snapshot, error == nil else {
              //handle error
              return
            }
            print("Number of documents: \(snapshot.documents.count ?? -1)")
            snapshot.documents.forEach({ (documentSnapshot) in
              let documentData = documentSnapshot.data()
                self.playerIDs.append( documentData["playerID"] as! String)

            })
              
          }
//        sendNoti
        }
    }


