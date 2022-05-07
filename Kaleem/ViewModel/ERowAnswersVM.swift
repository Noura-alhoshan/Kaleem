//
//  ERowAnswersVM.swift
//  Kaleem
//
//  Created by نوره سعد on 02/10/1443 AH.
//

import SwiftUI

struct ERowAnswersVM: View {
    @EnvironmentObject var quizManager1: EQuizManagerVM
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
        .background(Color("AnsRow"))
        .cornerRadius(10)
        .shadow(color: isSelected ? answer.isCorrect ? .green : .red : .gray, radius: 5, x: 0.5, y: 0.5)
        .onTapGesture {
            if !quizManager1.answerSelected {
                isSelected = true
                quizManager1.selectAnswer(answer: answer)

            }
        }
    }
}

struct ERowAnswersVM_Previews: PreviewProvider {
    static var previews: some View {
        ERowAnswersVM(answer: QuestionModel.Answer(text: "الجواب الاول", isCorrect:  false))
            .environmentObject(EQuizManagerVM())
    }
}
//*/
