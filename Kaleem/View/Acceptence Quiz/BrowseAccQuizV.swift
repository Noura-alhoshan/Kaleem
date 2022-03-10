//
//  BrowseAccQuizV.swift
//  Kaleem
//
//  Created by Sarah S on 19/07/1443 AH.
//

import SwiftUI
//import UIKit


struct BrowseAccQuizV: View {
    
    @ObservedObject private var viewModel = ContactViewModel()
    @State var showDetails: Bool = false
    @State var showAddQestion: Bool = false
    @State var SelectedQuestion: QuestionModel = QuestionModel(Qid: "whatever", question: "String", correctAnswer: "correct", questionText: "String", answers: [QuestionModel.Answer (id: UUID() , text: "answer1", isCorrect:  true),
                  QuestionModel.Answer (id: UUID() , text: "answer1", isCorrect:  true),
                  QuestionModel.Answer (id: UUID() , text: "answer1", isCorrect:  true),
                  QuestionModel.Answer (id: UUID() , text: "answer1", isCorrect:  true)])//this is just temp until i fill it below
    @State var QuestionID = ""
    
    var body: some View {
        
        NavigationLink(destination: AddQuizForm().environmentObject(AQuizManagerVM()), isActive: $showAddQestion, label: {EmptyView()} )
      
        
        
        ZStack(alignment: .bottomTrailing) {//to hold the floating + button
            
            NavigationLink(destination: QuestionDetails(SelectedQuestion: SelectedQuestion, QuestionID: QuestionID).environmentObject(AQuizManagerVM()), isActive: $showDetails, label: {EmptyView()} )
            
       
            
            List(viewModel.questions) { Qmodel in
                ZStack(alignment: .trailing) {
                    
                    HStack {
                        ZStack {
                            
                            AsyncImage(url: URL(string: Qmodel.question) ,scale: 5.5).frame(width: 230, height: 150 )
                            
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
                    
                    
                }
                .onTapGesture {
                    SelectedQuestion = QuestionModel(Qid: Qmodel.Qid, question: Qmodel.question, correctAnswer: Qmodel.correctAnswer, questionText: Qmodel.questionText, answers:Qmodel.answers)
                    QuestionID = viewModel.docID//IMPORTANT
                    showDetails = true;
                    
                }
                .clipShape(RoundedRectangle(cornerRadius: 15))//.listStyle(InsetGroupedListStyle())
                //.background(.green.opacity(0.1) ) //:Color .gray.opacity(0.1))
            }
            
            .onAppear() { self.viewModel.fetchData()}
            
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
 
        
    }
}

