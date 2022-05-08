import Foundation
import FirebaseFirestore
//import FirebaseFirestoreSwift
class SentencesVM: ObservableObject {
    
    //An array of the whole docs in LocationSentences collection
    @Published var LocalSentences = [String]()
    @Published var coffee = [CoffeeSentenceM]()
    @Published var uniList = [UniSentenceM]()
    @Published var FavList = [FavSentence]()
    
    //    init(){
    //        FavFetchData()
    //    }
    
    private var db = Firestore.firestore()
    
    @Published var CoffeeOneSentence: CoffeeSentenceM = CoffeeSentenceM(S1: "Defualt", S2: "Defualt", S3: "Defualt", S4: "Defualt", S5: "Defualt", category: "DefualtCategory")
    
    //    @Published var UniOneSentence: UniSentenceM = UniSentenceM(S1: "Defualt", S2: "Defualt", S3: "Defualt", S4: "Defualt", S5: "Defualt",S6: "Defualt",S7: "Defualt",S8: "Defualt",S9: "Defualt",S10: "Defualt", category: "DefualtCategory")
    
    
    //Cafe fetch data
    func CoffeeFetchData( ) {
        db.collection("LocationSentences").document("Coffee").getDocument { (document, error) in
            if let document = document, document.exists {
                
                self.CoffeeOneSentence.S1 = document["S1"] as? String ?? ""
                self.CoffeeOneSentence.S2 = document["S2"] as? String ?? ""
                self.CoffeeOneSentence.S3 = document["S3"] as? String ?? ""
                self.CoffeeOneSentence.S4 = document["S4"] as? String ?? ""
                self.CoffeeOneSentence.S5 = document["S5"] as? String ?? ""
                
            } else {
                print("Document does not exist")
                
            }
        }
    }
    
    func UniFetchData( ) {
        
        db.collection("Uni").addSnapshotListener { (querySnapshot, error) in
            guard let documents = querySnapshot?.documents else {
                print("No documents")
                return
            }
            
            self.uniList = documents.map { (queryDocumentSnapshot) -> UniSentenceM in
                let data = queryDocumentSnapshot.data()
                let Sentence = data ["Sentence"] as? String ?? ""
                let liked = data["liked"] as? String ?? ""
                let docID = queryDocumentSnapshot.documentID
                return UniSentenceM(Sentence: Sentence, isFaved: liked, id: docID)
            }
        }
        
    }
    
    
    
    
    func FavFetchData( ) {
        db.collection("FavoriteList").addSnapshotListener { (querySnapshot, error) in
            guard let documents = querySnapshot?.documents else {
                print("No documents")
                return
            }
            
            self.FavList = documents.map { (queryDocumentSnapshot) -> FavSentence in
                let data = queryDocumentSnapshot.data()
                let Sentence = data ["Sentence"] as? String ?? ""
                let liked = data["liked"] as? String ?? ""
                let docID = queryDocumentSnapshot.documentID
                return FavSentence(Sentence: Sentence, isFaved: liked, id: docID)
            }
        }
    }
    
//    //Delete favorite sentence from the favorite list
//    func deleteFavSen(id: String){
//        db.collection("FavoriteList").document(id).delete(){ err in
//            if let err = err {
//                print("Error while removing the document: \(err)")
//            }
//            else {
//                print("Document has successfully removed!")
//                //  showSuccesfulDeleteAlert = true
//                
//            }
//            
//        }
//    }
    
    
    //Add favorite sentence to the favorite list
    func addFavSen(Sentence: String, isFaved: String, docId: String){
        //Change liked attribute
        if(isFaved == "false"){
            db.collection("FavoriteList").document(docId).setData(["liked": "true", "Sentence": Sentence]){ err in
                if let err = err {
                    print("Error while adding the document: \(err)")
                }
                else {
                    print("Document has successfully added!")
                    //  showSuccesfulDeleteAlert = true
                    
                } }
            
        }//end if
        
        updateLiked(isFaved: isFaved,id: docId)
        
    }
    
    
    //Remove favorite sentence from the favorite list
    func removeFavSen(Sentence: String, isFaved: String, docId: String){
        //Change liked attribute
        if(isFaved == "true"){
            db.collection("FavoriteList").document(docId).delete(){ err in
                if let err = err {
                    print("Error while removing the document: \(err)")
                }
                else {
                    print("Document has successfully removed!")
                    //  showSuccesfulDeleteAlert = true
                    
                } }
            
        }//end if
        
        updateLiked(isFaved: isFaved,id: docId)
    }
    
    
    
    //Update liked var in collection("Uni") -- > E doc["liked"] with "true" || "false"
    func updateLiked (isFaved: String, id: String){
        
        if(isFaved == "false"){
            db.collection("Uni").document(id).updateData(["liked": "true"
                                                         ])}
        
        
        else{
            db.collection("Uni").document(id).updateData(["liked": "false"
                                                         ])}
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
    
    
    
    //        db.collection("LocationSentences").document("uni").getDocument { (document, error) in
    //            if let document = document, document.exists {
    //
    //
    //                self.UniOneSentence.S1 = document["S1"] as? String ?? ""
    //                self.UniOneSentence.S2 = document["S2"] as? String ?? ""
    //                self.UniOneSentence.S3 = document["S3"] as? String ?? ""
    //                self.UniOneSentence.S4 = document["S4"] as? String ?? ""
    //                self.UniOneSentence.S5 = document["S5"] as? String ?? ""
    //                self.UniOneSentence.S6 = document["S6"] as? String ?? ""
    //                self.UniOneSentence.S7 = document["S7"] as? String ?? ""
    //                self.UniOneSentence.S8 = document["S8"] as? String ?? ""
    //                self.UniOneSentence.S9 = document["S9"] as? String ?? ""
    //                self.UniOneSentence.S10 = document["S10"] as? String ?? ""
    //
    //            } else {
    //                print("Document does not exist")
    //
    //            }
    //        }
    
    
    
    //        db.collection("FavoriteSentences").document("Coffee").getDocument { (document, error) in
    //            if let document = document, document.exists {
    //
    //                self.CoffeeOneSentence.S1 = document["S1"] as? String ?? ""
    //                self.CoffeeOneSentence.S2 = document["S2"] as? String ?? ""
    //                self.CoffeeOneSentence.S3 = document["S3"] as? String ?? ""
    //                self.CoffeeOneSentence.S4 = document["S4"] as? String ?? ""
    //                self.CoffeeOneSentence.S5 = document["S5"] as? String ?? ""
    //
    //            } else {
    //                print("Document does not exist")
    //                print("we are here")
    //
    //            }
    //        }
    
}
