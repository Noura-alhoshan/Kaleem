//
//  ContentView.swift
//  Kaleem
//
//  Created by نوره سعد on 21/06/1443 AH.
//
///*
import SwiftUI
import Firebase //

struct ContentView: View {
    

    
   @StateObject var QuizManager1 = QuizManager()
   @ObservedObject var foodDatas = FoodViewModel()
   // @Published var all = foodDatas.fetchData()
    @State var a = [User]()
    
    

   var body: some View {

       NavigationView {

           VStack(spacing: 40) {
               
               NavigationLink {
                   
                   QuizView()
                     .environmentObject(QuizManager1)
                   
               } label: {
                   PrimaryButton(text: "Let's go!"+"")
               }.onTapGesture {
                   Task.init {
                       await QuizManager1.fetchQuiz()
                   }               }.background(Color(red: 0.984313725490196, green: 0.9294117647058824, blue: 0.8470588235294118))

           }
           }
           .onAppear() {
//               self.foodDatas.fetchData{
//                   result in
//                   switch result{
//                   case .success(let users):
//                      a = users
////                       myQuiz1 = [
////
////                           QuizModel(
////
////                               question: a[0].name,
////                               correctAnswer: "q1",
////                               incorrectAnswers: ["ans1","ans2","ans4 correct"],
////                               answers: [Answer(text: "q1", isCorrect: true),Answer(text: "q2", isCorrect: false),Answer(text: "q1", isCorrect: true),Answer(text: "q1", isCorrect: true)]
////                          ),
////
////                           QuizModel(
////
////                               question: "q1",
////                               correctAnswer: "q1",
////                               incorrectAnswers: ["ans1","ans2","ans4 correct"],
////                               answers: [Answer(text: "q1", isCorrect: true),Answer(text: "q2", isCorrect: false)]
////                          ),
////
////                           QuizModel(
////
////                               question: "q1",
////                               correctAnswer: "q1",
////                               incorrectAnswers: ["ans1","ans2","ans4 correct"],
////                               answers: [Answer(text: "q1", isCorrect: true),Answer(text: "q2", isCorrect: false)]
////                          ),
////                           QuizModel(
////
////                               question: "q1",
////                               correctAnswer: "q1",
////                               incorrectAnswers: ["ans1","ans2","ans4 correct"],
////                               answers: [Answer(text: "q1", isCorrect: true),Answer(text: "q2", isCorrect: false)]
////                          ),
////
////                           QuizModel(
////
////                               question: "q1",
////                               correctAnswer: "q1",
////                               incorrectAnswers: ["ans1","ans2","ans4 correct"],
////                               answers: [Answer(text: "q1", isCorrect: true),Answer(text: "q2", isCorrect: false)]
////                          ),
////
////                       ]
//
//                       //print(a[1].name)
//                   case .failure(let error):
//                       print(error.localizedDescription)
//                   }
//           }
       }
   }
}
    /*
    @StateObject var QuizManager1 = QuizManager()

    var body: some View {
        NavigationView {

        VStack(spacing: 40) {
            
            NavigationLink {
                QuizView()
                  .environmentObject(QuizManager1)
            } label: {
                PrimaryButton(text: "Let's go!")
            }.background(Color(red: 0.984313725490196, green: 0.9294117647058824, blue: 0.8470588235294118))

        }
        }
    }
     */
//}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        
        
        
    }
}
//*/
