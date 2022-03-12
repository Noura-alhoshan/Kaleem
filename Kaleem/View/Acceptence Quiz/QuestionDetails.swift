import SwiftUI

struct QuestionDetails: View {
    @EnvironmentObject var quizManager1: AQuizManagerVM
    @ObservedObject var viewModel = ContactViewModel()
    @State var SelectedQuestion: QuestionModel
    @State var showEditForm = false
    @State var QuestionID: String
    
    var body: some View {
        
        ZStack(alignment: .bottomLeading) {//to hold the floating + button
            
        VStack(spacing: 30) {

            NavigationLink(destination:  EditAccQuizForm( QID: SelectedQuestion.Qid ,Question: viewModel.oneQuestion.questionText, ImageQuestion: viewModel.oneQuestion.question, CorrectAnswer: viewModel.oneQuestion.correctAnswer,
                                                          answer1: viewModel.oneQuestion.answers[0].text,
                                                          answer2: viewModel.oneQuestion.answers[1].text,
                                                          answer3: viewModel.oneQuestion.answers[2].text,
                                                          answer4: viewModel.oneQuestion.answers[3].text)
                            .environmentObject(AQuizManagerVM()), isActive: $showEditForm, label: {EmptyView()} )
            
           
            VStack( spacing: 19) {

                AsyncImage(url: URL(string: viewModel.oneQuestion.question), scale: 4.0).frame(width: 330, height: 180 )}

            Text(viewModel.oneQuestion.questionText)
                    .font(.system(size: 20))
                    .bold()
                    .foregroundColor(.gray).multilineTextAlignment(.trailing)

                ForEach(viewModel.oneQuestion.answers, id: \.id) { answer in
                    HStack(spacing: 20) {

                        Text(answer.text)
                            //.bold()

                    }
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .foregroundColor( .black.opacity(0.75))
                    .background(viewModel.oneQuestion.correctAnswer == answer.text ? .green.opacity(0.1) :Color .gray.opacity(0.1))
                    .cornerRadius(10)
                    //.shadow(color: .gray, radius: 5, x: 0.5, y: 0.5)
                
            }
            
            Spacer(minLength: 20)
            
        }.onAppear(perform: {
            viewModel.fetchQuestion(Qid: SelectedQuestion.Qid)
        })
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .trailing)
        .background(.white)
       //.navigationBarHidden(true)
            
            
            Button(action: {
                showEditForm = true
            }) {
                Image(systemName: "pencil.circle.fill")
                    .resizable()
                    .frame(width: 80, height: 80)
                    .foregroundColor(Color("Kaleem"))
                    .shadow(color: .gray, radius: 0.2, x: 1, y: 1)
            }
                .padding()
            
        }
    }
}
