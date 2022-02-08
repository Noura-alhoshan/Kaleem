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

    var body: some View {
        if quizManager1.reachedEnd {
            
            
            
            if(quizManager1.score > 6){
            VStack(spacing: 20) {
                // the reguesteration logic 
                //Text("You scored \(quizManager1.score) P")
            }
            .foregroundColor(Color("Kaleem"))
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            }else{
                VStack(spacing: 20) {
                    Text("نعتذر قدرتك المعرفية في لغة الاشارة اقل من اللازم")
                }
                .foregroundColor(Color("Kaleem"))
                .padding()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                
            }
            
        }
    
        else {
            AQuestionV()
                .environmentObject(quizManager1)
        }
    }
}

struct AQuizV_Previews: PreviewProvider {
    static var previews: some View {
        AQuizV()
            .environmentObject(AQuizManagerVM())
    }
}
// */

