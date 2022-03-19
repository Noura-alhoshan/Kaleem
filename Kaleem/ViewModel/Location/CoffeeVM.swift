import Foundation
import FirebaseFirestore
//import FirebaseFirestoreSwift
class CoffeeVM: ObservableObject {
    
    //An array of the whole docs in LocationSentences collection
   // @Published var cafeSentences = [DocSentencesM] ()
    @Published var LocalSentences = [String]()
    @Published var coffee = [DocSentencesM]()
    private var db = Firestore.firestore()
    
    @Published var oneSentence: DocSentencesM = DocSentencesM(S1: "Defualt", S2: "Defualt", S3: "Defualt", S4: "Defualt", S5: "Defualt", category: "DefualtCategory")
    
 
    
    func fetchData( ) {
               db.collection("LocationSentences").document("Coffee").getDocument { (document, error) in
                   if let document = document, document.exists {
//                       let S1 = document["S1"] as? String ?? ""
//                       let S2 = document["S2"] as? String ?? ""
//                       let S3 = document["S3"] as? String ?? ""
//                       let S4 = document["S4"] as? String ?? ""
//                       let S5 = document["S5"] as? String ?? ""
                       
                       self.oneSentence.S1 = document["S1"] as? String ?? ""
                       self.oneSentence.S2 = document["S2"] as? String ?? ""
                       self.oneSentence.S3 = document["S3"] as? String ?? ""
                       self.oneSentence.S4 = document["S4"] as? String ?? ""
                       self.oneSentence.S5 = document["S5"] as? String ?? ""

                   } else {
                       print("Document does not exist")

                        }
               }
           }
    
    
//    func fetchData() -> Array<String> {
//
//        db.collection("LocationSentences").document("coffee").getDocument { (document, error) in
//            if let document = document, document.exists {
//
//                self.LocalSentences = document["sentences"] as? [String] ??
//
//
//                for i in self.LocalSentences {
//
//
//
//                    self.LocalSentences[i] = document["sentences"][i] as? String ?? ""
//
//
//                }
//
//            } else {
//                print("Document does not exist")
//
//            }
//
//        }
//
//        return self.LocalSentences
//    }
    
//        func fetchData() {
//
//            //coffee?.sentencesArray
//            db.collection("LocationSentences").document("Coffee").getDocument { [self] snapshot, error in
//                if let error = error {
//                    print(error.localizedDescription +  "GOT YOUUUUUUU3")
//                }
//                do {
//                    self.coffee = try snapshot?!.data(as: DocSentencesM.self)
//
//                  //  print(self.coffee?.category ?? "" + "GOT YOUUUUUUU")
//
//                } catch {
//                    print(error.localizedDescription +  "GOT YOUUUUUUU2")
//                }
//
//            }
//
//
////            db.collection("LocationSentences").getDocuments { snapshot, error in
////                if let error = error {
////                    print(error.localizedDescription)
////                }
////                guard let documets = snapshot?.documents else { return }
////
////            }
//
////            @FirestoreQuery(
////                collectionPath: "LocationSentences",
////                predicates: [.where ("category", isEqualTo: "cafe")]
////             ) var cafeSentences: [DocSentencesM]
//
//
//
////
////            db.collection("LocationSentences").document("coffee").getDocument { (document, error) in
////                if let document = document, document.exists {
////                } else {
////                    print("Document does not exist")
////
////                     }
////
////
////
////
////            self.cafeSentences = document.compactMap { (queryDocumentSnapshot) -> DocSentencesM? in
////
////
////
////                    return try? queryDocumentSnapshot.data(as: DocSentencesM.self)
////
////
////                }
////            }
////
////            for i in self.cafeSentences{
////            if i.category == "cafe" {
////
////                for sentencesArray in i.sentencesArray {
////                    print("\(sentencesArray)")
////                }
////
////            }
////
////            }
//
//
//
////    func   printFetching(){
////
////
////        let querySnapshot: () = fetchData()
////
////        let question = querySnapshot["category"] as? String ?? ""
////
////
////
////        //     for i in querySnapshot {
////        //
////        print(querySnapshot("category") )
////        //
////        //     }
////
////    }
//
//
//
//
//
//
//
//}
    
    /*******************/
    
    

    
    
    
    
}
