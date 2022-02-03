//
//  UserViewModel.swift
//  Kaleem
//
//  Created by نوره سعد on 27/06/1443 AH.
//
/*
import Foundation
import FirebaseFirestore
 
class userViewModel: ObservableObject {
    @Published var users = [User]()
    @Published var noura = [User]()


    private var db = Firestore.firestore()
     
    func fetchData() {
        db.collection("items").addSnapshotListener { (querySnapshot, error) in
            guard let documents = querySnapshot?.documents else {
                print("No documents")
                return
            }
             
            self.users = documents.map { (queryDocumentSnapshot) -> User in
                let data = queryDocumentSnapshot.data()
                let name = data["name"] as? String ?? ""
                let surname = data["msg"] as? String ?? ""
                return User(name: name, surname: surname)
            }
        }
    }


}
*/
/*
import Foundation
import Firebase

class FoodViewModel: ObservableObject {

@Published var datas = [User]()

    var h=0
private var db = Firestore.firestore()

 //   var myQuiz1 : [QuizModel] = [

    
    
func fetchData() {
    print("hello1")

    db.collection("items").addSnapshotListener { (snap, err) in
        DispatchQueue.main.async {
        if err != nil {
            print((err?.localizedDescription)!)
            return
        } else {
        for i in snap!.documents{
                
            let data = i.data()
            let name = data["name"] as? String ?? ""
            let surname = data["msg"] as? String ?? ""
        //    print(self.datas[i].name)

            print("hello2")

            return self.datas.append( User( name: name, surname: surname))
           // print(self.datas[self.h].name)
           // self.h = self.h+1

            }
        }
        }
    }
    //print(self.datas[0].name)

}

}
*/
import Foundation
import Firebase

class FoodViewModel: ObservableObject {

@Published var datas = [User]()

    var h=0
private var db = Firestore.firestore()

 //   var myQuiz1 : [QuizModel] = [

    
    
//    func fetchData(completion: @escaping (Result<[User],Error>) -> Void) {
//    print("hello1")
//
//    db.collection("items").addSnapshotListener { (snap, err) in
//        DispatchQueue.main.async {
//        if err != nil {
//            print((err?.localizedDescription)!)
//            completion(.failure(err!))
//            return
//        } else {
//          var users = [User]()
//        for i in snap!.documents{
//
//            let data = i.data()
//            let name = data["name"] as? String ?? ""
//            let surname = data["msg"] as? String ?? ""
//        //    print(self.datas[i].name)
//
//            print("hello2")
//
//            users.append(User( name: name, surname: surname))
//           // print(self.datas[self.h].name)
//           // self.h = self.h+1
//
//            }
//            completion(.success(users))
//        }
//        }
//    }
//    //print(self.datas[0].name)
//
//}

}
