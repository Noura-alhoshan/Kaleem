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
                
                Text("\(QuizManager1.length) من \(QuizManager1.index + 1)"+" أسئلة")
                    .foregroundColor(Color("AccentColor"))
                    .fontWeight(.heavy)
                
                Spacer()

                Text("اختبار القبول")
                   .foregroundColor(Color("AccentColor"))
                   .fontWeight(.heavy).font(Font.system(size: 22))
                
                
           
            }
            
            ProgressBar(progress: QuizManager1.progress)
            
//                Text(QuizManager1.question)
//                    .font(.system(size: 20))
//                    .bold()
//                    .foregroundColor(.gray)
            VStack(alignment: .leading, spacing: 20) {

            AsyncImage(url: URL(string: "https://firebasestorage.googleapis.com/v0/b/meras-87629.appspot.com/o/Guidlines%2Fdata%2Fuser%2F0%2Fcom.example.meras%2Fcache%2Fimage_picker105114759293510834.jpg?alt=media&token=c4ade4fb-b024-462d-b277-824c600bccd7")).frame(width: 1, height: 1 )

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
