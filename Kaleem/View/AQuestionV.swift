//
//  QuestionView.swift
//  Kaleem
//
//  Created by نوره سعد on 26/06/1443 AH.
//
///*
import SwiftUI

struct AQuestionV: View {
    @EnvironmentObject var quizManager1: AQuizManagerVM

    var body: some View {
        VStack(spacing: 25) {
           // HStack {
                
               // Spacer()

                Text("اختبار القبول")
                .foregroundColor(.black)
                   .font(Font.system(size: 22))
                   .padding(.top, 20)
                  
            
            VStack(alignment: .trailing) {

            Text("\(quizManager1.index + 1) من 7"+" أسئلة")
                    .foregroundColor(Color("Kaleem")).frame(width: 333, height: 25,alignment: .topTrailing)
                
                
            }
              //  .fontWeight(.heavy)}
            
                
         //   }
            
            
            AProgressBarVM(progress: quizManager1.progress)
            
          
            VStack( spacing: 10) {

                AsyncImage(url: URL(string: quizManager1.question), scale: 3.0).frame(width: 330, height: 180 )}

            Text( quizManager1.questionText )
                    .font(.system(size: 20))
                    .bold()
                    .foregroundColor(.gray)

                ForEach(quizManager1.answerChoices, id: \.id) { answer in
                    ARowAnswersVM(answer: answer)
                        .environmentObject(quizManager1)
                
            }
            
            Button {
                quizManager1.goToNextQuestion()
            } label: {
                APrimaryButtonVM(text: "التالي", background: quizManager1.answerSelected ? Color("Kaleem") : Color("AnsRow"))
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

struct AQuestionV_Previews: PreviewProvider {
    static var previews: some View {
        AQuestionV()
            .environmentObject(AQuizManagerVM())
    }
}

 
 //*/
