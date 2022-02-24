//
//  ContentView.swift
//  Kaleem
//
//  Created by نوره سعد on 21/06/1443 AH.
//
///*
import SwiftUI
import Firebase //

struct AQuizContentV: View {
    

   @StateObject var quizManager1 = AQuizManagerVM()

   var body: some View {

       NavigationView {

           VStack(spacing: 40) {
               
               NavigationLink {
                   
                   AQuizV()
                     .environmentObject(quizManager1)
                   
               } label: {
                   APrimaryButtonVM(text: "Let's go!"+"")
               }.onTapGesture {
                   Task.init {
                       await quizManager1.fetchQuiz()
                   }               }.background(Color(red: 0.984313725490196, green: 0.9294117647058824, blue: 0.8470588235294118))

           }
           }
   }
}

struct AQuizContentV_Previews: PreviewProvider {
    static var previews: some View {
        AQuizContentV()
      
    }
}
