//
//  QuestionView.swift
//  Kaleem
//
//  Created by نوره سعد on 26/06/1443 AH.
//
///*
import SwiftUI

struct QuestionView: View {
    @EnvironmentObject var quizManager1: QuizManager

    var body: some View {
        VStack(spacing: 25) {
            HStack {
                
                Text("\(quizManager1.length) من \(quizManager1.index + 1)"+" أسئلة")
                    .foregroundColor(Color("Kaleem"))
                    .fontWeight(.heavy)
                
                Spacer()

                Text("اختبار القبول")
                   .foregroundColor(Color("Kaleem"))
                   .fontWeight(.heavy).font(Font.system(size: 22))
                
            }
            
            ProgressBar(progress: quizManager1.progress)
            
          
            VStack( spacing: 10) {

                AsyncImage(url: URL(string: quizManager1.question), scale: 3.0).frame(width: 330, height: 180 )}
            VStack(alignment: .trailing) {

                Text("ماذا تعني هذه الإشارة؟")
                    .font(.system(size: 20))
                    .bold()
                    .foregroundColor(.gray)}

                ForEach(quizManager1.answerChoices, id: \.id) { answer in
                    AnswerRow(answer: answer)
                        .environmentObject(quizManager1)
                
            }
            
            Button {
                quizManager1.goToNextQuestion()
            } label: {
                PrimaryButton(text: "التالي", background: quizManager1.answerSelected ? Color("Kaleem") : Color(hue: 1.0, saturation: 0.0, brightness: 0.564, opacity: 0.327))
            }
            .disabled(!quizManager1.answerSelected)
            
            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .trailing)
        .background(.white)
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
