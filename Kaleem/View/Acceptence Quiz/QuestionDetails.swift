import SwiftUI

struct QuestionDetails: View {
    @EnvironmentObject var quizManager1: AQuizManagerVM
    @State var SelectedQuestion: QuestionModel
    
    var body: some View {
        VStack(spacing: 30) {
                
            VStack( spacing: 19) {

                AsyncImage(url: URL(string: SelectedQuestion.question), scale: 3.0).frame(width: 330, height: 180 )}

            Text(SelectedQuestion.questionText)
                    .font(.system(size: 20))
                    .bold()
                    .foregroundColor(.gray)

                ForEach(SelectedQuestion.answers, id: \.id) { answer in
                    HStack(spacing: 20) {

                        Text(answer.text)
                            .bold()

                    }
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .foregroundColor( .black.opacity(0.5))
                    .background(SelectedQuestion.correctAnswer == answer.text ? .green.opacity(0.1) :Color .gray.opacity(0.1))
                    .cornerRadius(10)
                    .shadow(color: .gray, radius: 5, x: 0.5, y: 0.5)
                
            }
            
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .trailing)
        .background(.white)
       //.navigationBarHidden(true)
       .navigationBarItems(trailing:
                        Button(action: {
                            //self.presentationMode.wrappedValue.dismiss()
                        }) {
                            HStack {
                                //Image(systemName: "arrow.left")
                                Text("تعديل")//.foregroundColor(.red)
                            }
                    })
    }
}

