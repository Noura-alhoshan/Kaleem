//
//  QuestionView.swift
//  Kaleem
//
//  Created by نوره سعد on 26/06/1443 AH.
//
///*
import SwiftUI

struct QuestionView: View {
    @EnvironmentObject var QuizManager1: QuizManager

    var body: some View {
        VStack(spacing: 40) {
            HStack {
                Text("Signs Game")
                   .lilacTitle()
                
                Spacer()
                
                Text("\(QuizManager1.index + 1) out of \(QuizManager1.length)")
                    .foregroundColor(Color("AccentColor"))
                    .fontWeight(.heavy)
            }
            
            ProgressBar(progress: QuizManager1.progress)
            
            VStack(alignment: .leading, spacing: 20) {
                Text(QuizManager1.question)
                    .font(.system(size: 20))
                    .bold()
                    .foregroundColor(.gray)
                
                ForEach(QuizManager1.answerChoices, id: \.id) { answer in
                    AnswerRow(answer: answer)
                        .environmentObject(QuizManager1)
                }
            }
            
            Button {
                QuizManager1.goToNextQuestion()
            } label: {
                PrimaryButton(text: "Next", background: QuizManager1.answerSelected ? Color("AccentColor") : Color(hue: 1.0, saturation: 0.0, brightness: 0.564, opacity: 0.327))
            }
            .disabled(!QuizManager1.answerSelected)
            
            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .background(Color(red: 0.984313725490196, green: 0.9294117647058824, blue: 0.8470588235294118))
        .navigationBarHidden(true)
    }
}

struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView()
            .environmentObject(QuizManager())
    }
}

 
 //*/
