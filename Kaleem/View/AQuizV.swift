//
//  QuizView.swift
//  Kaleem
//
//  Created by نوره سعد on 26/06/1443 AH.
//
///*
import SwiftUI

struct AQuizV: View {
    @EnvironmentObject var quizManager1: AQuizManagerVM
//    @State var VM = SignUpVM()
//    @State var username = ""
//    @State var phoneNo = "" // change to phone
//    @State var email = ""
//    @State var pass = ""
    // confirmation alert vars
    @State var showAlert = false
    @State var alertAction: AlertAction2?
    @State var showNextPage = false
//    init(username: String, phoneNo: String,email: String,pass: String) {
//        self.username = username
//        self.phoneNo = phoneNo
//        self.email = email
//        self.pass = pass
//
//    }
    // call from SignUpVM : View Model (firebase)
//    func updateStatus (status: String){
//        quizManager1.updateStatus(status: status)
//        
//    }
//    
    var body: some View {
        if quizManager1.reachedEnd {
            
            if(quizManager1.score > 5){
            VStack(spacing: 20) {
                // the reguesteration logic 
                //Text("You scored \(quizManager1.score) P")
                
                // TO SHOW ALERT ####################
                CustomAlertQuiz(shown: $showAlert, closureA: $alertAction, oneBtn: true, showNextPage: $showNextPage,imgName: "check",title: "تهانينا!", message: "تم تسجيلك بنجاح", btn1: "حسنا", btn2: "")
              
                
                        
            }
            .foregroundColor(Color("Kaleem"))
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            }else{
//                VStack(spacing: 20) {
//                    Text("نعتذر قدرتك المعرفية في لغة الاشارة اقل من اللازم")
//                }
//                .foregroundColor(Color("Kaleem"))
//                .padding()
//                .frame(maxWidth: .infinity, maxHeight: .infinity)
                // TO SHOW ALERT ####################
                CustomAlertQuiz(shown: $showAlert, closureA: $alertAction, oneBtn: true, showNextPage: $showNextPage,imgName: "check",title: "عذرًا", message: "معرفتك لا تؤهلك للمساعدة", btn1: "حسنا", btn2: "")
            }
            
        }
    
        else {
            AQuestionV()
                .environmentObject(quizManager1)
        }
    }
}

//struct AQuizV_Previews: PreviewProvider {
//    static var previews: some View {
//        AQuizV()
//            .environmentObject(AQuizManagerVM())
//    }
//}
// */

