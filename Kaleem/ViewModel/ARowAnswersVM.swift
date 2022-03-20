//
//  RowAnswers.swift
//  Kaleem
//
//  Created by نوره سعد on 26/06/1443 AH.
//
///*
import SwiftUI

struct ARowAnswersVM: View {
    @EnvironmentObject var quizManager1: AQuizManagerVM
    var answer: QuestionModel.Answer
    @State private var isSelected = false


    var body: some View {

        HStack(spacing: 20) {

            Text(answer.text)
                .bold()

        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .trailing)
        .foregroundColor(quizManager1.answerSelected ? (isSelected ? Color("Kaleem") : .gray) : Color("Kaleem"))
        .background(Color("KGray"))
        .cornerRadius(10)
        .shadow(color: isSelected ? answer.isCorrect ? .orange : .orange : .gray, radius: 5, x: 0.5, y: 0.5)
        .onTapGesture {
            if !quizManager1.answerSelected {
                isSelected = true
                quizManager1.selectAnswer(answer: answer)

            }
        }
    }
}

struct ARowAnswersVM_Previews: PreviewProvider {
    static var previews: some View {
        ARowAnswersVM(answer: QuestionModel.Answer(text: "الجواب الاول", isCorrect:  false))
            .environmentObject(AQuizManagerVM())
    }
}
//*/
