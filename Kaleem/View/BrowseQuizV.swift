//
//  BrowseEduQuizV.swift
//  Kaleem
//
//  Created by Sarah S on 02/04/2022.
//


import SwiftUI

struct BrowseQuizV: View {
   // @Environment(\.presentationMode) var mode: Binding<PresentationMode> //this one caused error

    @ObservedObject private var viewModel = ContactViewModel()
    @State var quizColl: String
    @State var showDetails: Bool = false
    @State var showAddQestion: Bool = false
    @State var goBack: Bool = false
    @State var SelectedQuestion: QuestionModel = QuestionModel(Qid: "whatever", question: "String", correctAnswer: "correct", questionText: "String", answers: [QuestionModel.Answer (id: UUID() , text: "answer1", isCorrect:  true),
                  QuestionModel.Answer (id: UUID() , text: "answer1", isCorrect:  true),
                  QuestionModel.Answer (id: UUID() , text: "answer1", isCorrect:  true),
                  QuestionModel.Answer (id: UUID() , text: "answer1", isCorrect:  true)])//this is just temp until i fill it below
    @State var QuestionID = ""
    
    var body: some View {
        
        NavigationLink(destination: AddQuizForm(quizCollection: quizColl).environmentObject(AQuizManagerVM()), isActive: $showAddQestion, label: {EmptyView()} )
        NavigationLink(destination: QuestionDetails(quizCollec: quizColl, SelectedQuestion: SelectedQuestion, QuestionID: QuestionID).environmentObject(AQuizManagerVM()), isActive: $showDetails, label: {EmptyView()} )
        NavigationLink(destination:Admin2Home(), isActive: $goBack, label: {EmptyView()} )
        
   
      
        HStack{
            if (quizColl == "EducationalQuiz"){
            Text("أسئلة اختبار المعرفة")
                .foregroundColor(.black.opacity(0.7))
                .font(.title)
                .fontWeight(.bold)
                .padding(.horizontal,22)
                .padding(.top,12)
            }
            else {
                Text("أسئلة اختبار القبول")
                    .foregroundColor(.black.opacity(0.7))
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.horizontal,22)
                    .padding(.top,12)
            }
            Spacer()
            Button(action: {
                                
                                withAnimation(.easeInOut){
                                    self.goBack = true
                                }
                            }, label: {
                                Image(systemName: "chevron.right")
                                     .foregroundColor(.white)
                                     .padding(.vertical,10)
                                     .padding(.horizontal)
                                    // .background(Color.black.opacity(0.4))
                                     .background(Color("Color"))
                                     .cornerRadius(10)
                             
                            }).padding(.horizontal,25)
        }
        
    
        
        ZStack(alignment: .bottomLeading) {//to hold the floating + button
            
     
            
            List(viewModel.questions) { Qmodel in
                ZStack(alignment: .trailing) {
                    
                    HStack {
                        ZStack {
                            
                            AsyncImage(url: URL(string: Qmodel.question) ,scale: 7).frame(width: 230, height: 150 )
                            
                        }
                        .frame(width: 70, height: 70, alignment: .center)
                        
                        VStack(alignment: .trailing) {
                            Text(Qmodel.questionText)
                                .foregroundColor( .black.opacity(0.5))
                                .font(.headline)
                                .fontWeight(.bold)
                                .lineLimit(2)
                                .padding(.bottom, 5)
                            
                            HStack(alignment: .center) {
                                Spacer()
                                Text(Qmodel.correctAnswer)
                                    .foregroundColor( .black.opacity(0.5))
                                    .padding(.trailing, 6)
                                    .multilineTextAlignment(TextAlignment.trailing)
                                Image(systemName: "checkmark").font(.title.weight(.semibold)) .foregroundColor(.green) .padding(.trailing, 4)
                                
                            }
                            .padding(.bottom, 5)
                            
                        }
                        .padding(.horizontal, 5)
                    }
                    
                    .padding(30)
                    .overlay(
                               RoundedRectangle(cornerRadius: 15)
                                .stroke(Color.gray.opacity(0.4), lineWidth: 0.5)
                                .shadow(color: .gray.opacity(1), radius: 3, x: -2, y: 2)
                              
                           )
                }
                .onTapGesture {
                    SelectedQuestion = QuestionModel(Qid: Qmodel.Qid, question: Qmodel.question, correctAnswer: Qmodel.correctAnswer, questionText: Qmodel.questionText, answers:Qmodel.answers)
                    QuestionID = viewModel.docID//IMPORTANT
                    showDetails = true;
                    
                }
                //.clipShape(RoundedRectangle(cornerRadius: 15))//.listStyle(InsetGroupedListStyle())
                //.background(.green.opacity(0.1) ) //:Color .gray.opacity(0.1))
            }
            
            .onAppear() { self.viewModel.fetchData(quizCollection: quizColl)}
            .overlay(Group {
                           if viewModel.questions.isEmpty {
                               Text("لا يوجد أسئلة..").foregroundColor(.black.opacity(0.6))
                           }
                       })
            
            Button(action: {
                showAddQestion = true
            }) {
                Image(systemName: "plus.circle.fill")
                    .resizable()
                    .frame(width: 80, height: 80)
                    .foregroundColor(Color("Kaleem"))
                    .shadow(color: .gray, radius: 0.2, x: 1, y: 1)
            }
                .padding()
        }
        .navigationBarTitle("")
         .navigationBarHidden(true)
        
    }
}
