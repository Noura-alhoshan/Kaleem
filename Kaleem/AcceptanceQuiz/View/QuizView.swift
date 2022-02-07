//
//  QuizView.swift
//  Kaleem
//
//  Created by نوره سعد on 26/06/1443 AH.
//
///*
import SwiftUI

struct QuizView: View {
    @EnvironmentObject var QuizManager1: QuizManager

    var body: some View {
        if QuizManager1.reachedEnd {
            VStack(spacing: 20) {
                Text("Signs")
                    .lilacTitle()

                Text("Congratulations, you completed the game! ")
                
                Text("You scored \(QuizManager1.score) out of \(QuizManager1.length)")
                
                Button {
                    Task.init {
                        await QuizManager1.fetchQuizRestart()
                    }
                } label: {
                    PrimaryButton(text: "Play again")
                }
            }
            .foregroundColor(Color("Kaleem"))
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(red: 0.984313725490196, green: 0.9294117647058824, blue: 0.8470588235294118))
        } else {
            QuestionView()
                .environmentObject(QuizManager1)
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

