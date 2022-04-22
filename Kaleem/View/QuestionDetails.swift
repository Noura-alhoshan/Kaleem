import SwiftUI
import Firebase

struct QuestionDetails: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    @EnvironmentObject var quizManager1: AQuizManagerVM
    @ObservedObject var viewModel = ContactViewModel()
    @State var quizCollec: String
    @State var SelectedQuestion: QuestionModel
    @State var QuestionID: String
    @State var showEditForm = false
    @State private var showDeleteAlert = false
    @State private var showSuccesfulDeleteAlert = false
    
    
    //this is to delete a question
    func deleteQuestion(){
        Firestore.firestore().collection(quizCollec).document(self.SelectedQuestion.Qid).delete(){ err in
            if let err = err {//cloud deletion error
                print("Error removing document: \(err)")
            }
            else {
                print("Document successfully removed!")
                showSuccesfulDeleteAlert = true
                
            }
            
        }
    }
    
    var body: some View {
        
        VStack(spacing: 30) {
            HStack{
                Spacer()
                Button(action: {
                    
                    withAnimation(.easeInOut){
                        self.mode.wrappedValue.dismiss()
                    }
                }, label: {
                    Image(systemName: "chevron.right")
                        .foregroundColor(.white)
                        .padding(.vertical,10)
                        .padding(.horizontal)
                        .background(Color("Color"))
                        .cornerRadius(10)
                    
                }).padding(.horizontal,25)
            }
            
            NavigationLink(destination:  EditAccQuizForm( quizColl: quizCollec, QID: SelectedQuestion.Qid ,Question: viewModel.oneQuestion.questionText, ImageQuestion: viewModel.oneQuestion.question, CorrectAnswer: viewModel.oneQuestion.correctAnswer,
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
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .trailing)
                .foregroundColor( .black.opacity(0.75))
                .background(viewModel.oneQuestion.correctAnswer == answer.text ? .green.opacity(0.1) :Color .gray.opacity(0.1))
                .cornerRadius(10)
                //.shadow(color: .gray, radius: 5, x: 0.5, y: 0.5)
                
            }
            HStack(alignment: .center){
                
                Button(action: {
                    showDeleteAlert = true
                }, label: {
                    Text("حذف")
                        .foregroundColor(Color.white)
                        .fontWeight(.bold)
                        .padding(.vertical)
                        .padding(.horizontal,50)
                        .background(Color(#colorLiteral(red: 0.737254902, green: 0.1294117647, blue: 0.2941176471, alpha: 1)))
                        .clipShape(Capsule())
                        .shadow(color: Color.gray.opacity(0.1), radius:5 , x: 0, y: 5)//// change it
                })
                    .alert("هل أنت متأكد من حذف السؤال؟", isPresented: $showDeleteAlert, actions: {
                        Button("نعم", action: {
                            deleteQuestion()
                        })
                        Button("لا", role: .cancel, action: {})
                    })
                    .alert(isPresented: $showSuccesfulDeleteAlert) {
                        
                        Alert(
                            title: Text("تمت العملية بنجاح"),
                            message: Text("تم حذف السؤال من اختبار القبول"),
                            dismissButton: .default(
                                Text("إغلاق"),
                                action: { self.mode.wrappedValue.dismiss() })
                        )
                    }
                
                
                Button(action: {
                    showEditForm = true
                }, label: {
                    Text("تعديل")
                        .foregroundColor(Color.white)
                        .fontWeight(.bold)
                        .padding(.vertical)
                        .padding(.horizontal,50)
                        .background(Color("Kcolor"))
                        .clipShape(Capsule())
                        .shadow(color: Color.gray.opacity(0.1), radius:5 , x: 0, y: 5)//// change it
                })
            }//hstack
            
            Spacer(minLength: 39)///////////////////////////////here to change the space of the arrow and bottom of page
            
        }.onAppear(perform: {
            viewModel.fetchQuestion(Qid: SelectedQuestion.Qid, quizCollection: quizCollec)
        })
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .trailing)
            .background(.white)
            .navigationBarTitle("")
            .navigationBarHidden(true)
    }
}
