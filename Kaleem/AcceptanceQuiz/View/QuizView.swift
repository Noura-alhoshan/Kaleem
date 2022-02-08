//
//  QuizView.swift
//  Kaleem
//
//  Created by نوره سعد on 26/06/1443 AH.
//
///*
import SwiftUI

struct QuizView: View {
    @EnvironmentObject var quizManager1: QuizManager

    var body: some View {
        if quizManager1.reachedEnd {
            VStack(spacing: 20) {

                // the reguesteration logic 
                Text("You scored \(quizManager1.score) out of \(quizManager1.length)")
                
   
            }
            .foregroundColor(Color("Kaleem"))
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background( Color("AnsRow"))
        } else {
            QuestionView()
                .environmentObject(quizManager1)
        }
    }
}

struct QuizView_Previews: PreviewProvider {
    static var previews: some View {
        QuizView()
            .environmentObject(QuizManager())
    }
}
// */

