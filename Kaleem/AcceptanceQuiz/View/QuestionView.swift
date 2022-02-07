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
        VStack(spacing: 25) {
            HStack {
                
                Text("\(QuizManager1.length) من \(QuizManager1.index + 1)"+" أسئلة")
                    .foregroundColor(Color("Kaleem"))
                    .fontWeight(.heavy)
                
                Spacer()

                Text("اختبار القبول")
                   .foregroundColor(Color("Kaleem"))
                   .fontWeight(.heavy).font(Font.system(size: 22))
                
            }
            
            ProgressBar(progress: QuizManager1.progress)
            
          
            VStack( spacing: 10) {

                AsyncImage(url: URL(string: QuizManager1.question), scale: 3.0).frame(width: 330, height: 180 )}
            VStack(alignment: .trailing) {

                Text("ماذا تعني هذه الإشارة؟")
                    .font(.system(size: 20))
                    .bold()
                    .foregroundColor(.gray)}

                ForEach(QuizManager1.answerChoices, id: \.id) { answer in
                    AnswerRow(answer: answer)
                        .environmentObject(QuizManager1)
                
            }
            
            Button {
                QuizManager1.goToNextQuestion()
            } label: {
                PrimaryButton(text: "التالي", background: QuizManager1.answerSelected ? Color("Kaleem") : Color(hue: 1.0, saturation: 0.0, brightness: 0.564, opacity: 0.327))
            }
            .disabled(!QuizManager1.answerSelected)
            
            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .trailing)
        .background(.white)
            //Color(red: 0.984313725490196, green: 0.9294117647058824, blue: 0.8470588235294118))
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
