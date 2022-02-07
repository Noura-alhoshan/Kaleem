//
//  RowAnswers.swift
//  Kaleem
//
//  Created by نوره سعد on 26/06/1443 AH.
//
///*
import SwiftUI

struct AnswerRow: View {
    @EnvironmentObject var QuizManager1: QuizManager
    var answer: QuestionModel.Answer
    @State private var isSelected = false

    // Custom colors
  //  var green = Color(hue: 0.437, saturation: 0.711, brightness: 0.711)
  //  var red = Color(red: 0.71, green: 0.094, blue: 0.1)
    
    var body: some View {

        HStack(spacing: 20) {
         
            
            Text(answer.text)
                .bold()
            
//            Image(systemName: "circle.fill")
//                .font(.caption)
            
            if isSelected {
              //  Spacer()
                
//                Image(systemName: answer.isCorrect ? "checkmark.circle.fill" : "x.circle.fill")
//                    .foregroundColor(answer.isCorrect ? green : red)
            }
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .trailing)
        .foregroundColor(QuizManager1.answerSelected ? (isSelected ? Color("Kaleem") : .gray) : Color("Kaleem"))
        .background(Color("AnsRow"))
        .cornerRadius(10)
      //  .shadow(color: isSelected ? answer.isCorrect ? green : red : .gray, radius: 5, x: 0.5, y: 0.5)
        .shadow(color: isSelected ? answer.isCorrect ? .orange : .orange : .gray, radius: 5, x: 0.5, y: 0.5)
        .onTapGesture {
            if !QuizManager1.answerSelected {
                isSelected = true
                QuizManager1.selectAnswer(answer: answer)

            }
        }
    }
}

struct AnswerRow_Previews: PreviewProvider {
    static var previews: some View {
        AnswerRow(answer: QuestionModel.Answer(text: "الجواب الاول", isCorrect:  false))
            .environmentObject(QuizManager())
    }
}
//*/