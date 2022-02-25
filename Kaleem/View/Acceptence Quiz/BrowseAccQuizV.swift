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
    @State var SelectedQuestion: QuestionModel = QuestionModel(question: "String", correctAnswer: "correct", answers: [QuestionModel.Answer (id: UUID() , text: "answer1", isCorrect:  true),
        QuestionModel.Answer (id: UUID() , text: "answer1", isCorrect:  true),
        QuestionModel.Answer (id: UUID() , text: "answer1", isCorrect:  true),
        QuestionModel.Answer (id: UUID() , text: "answer1", isCorrect:  true)])
    
    
    var body: some View {
        
        
        NavigationLink(destination: QuestionDetails(SelectedQuestion: SelectedQuestion).environmentObject(AQuizManagerVM()), isActive: $showDetails, label: {EmptyView()} )
        
        NavigationLink(destination: AddQuizForm(SelectedQuestion: SelectedQuestion).environmentObject(AQuizManagerVM()), isActive: $showAddQestion, label: {EmptyView()} )
        
        
        ZStack(alignment: .bottomTrailing) {//to hold the floating + button
            
            List(viewModel.contacts) { Qmodel in
                ZStack(alignment: .trailing) {
                    
                    HStack {
                        ZStack {
                            
                            AsyncImage(url: URL(string: Qmodel.question) ,scale: 5.5).frame(width: 230, height: 150 )
                            
                        }
                        .frame(width: 70, height: 70, alignment: .center)
                        
                        VStack(alignment: .trailing) {
                            Text("ماذا تعني هذه الإشارة؟")
                                .foregroundColor( .black.opacity(0.5))
                                .font(.headline)
                                .fontWeight(.bold)
                                .lineLimit(2)
                                .padding(.bottom, 5)
                            
                            HStack(alignment: .center) {
                                Spacer()
                                Text(Qmodel.correctAnswer).foregroundColor( .black.opacity(0.5)) .padding(.trailing, 6)
                                Image(systemName: "checkmark").font(.title.weight(.semibold)) .foregroundColor(.green) .padding(.trailing, 4)
                                
                            }
                            .padding(.bottom, 5)
                            
                        }
                        .padding(.horizontal, 5)
                    }
                    .padding(30)
                    
                    
                }   //.background(.green.opacity(0.1) ) //:Color .gray.opacity(0.1))
                .onTapGesture {
                    SelectedQuestion = QuestionModel(question: Qmodel.question, correctAnswer: Qmodel.correctAnswer, answers:Qmodel.answers)
                    showDetails = true;
                }
                .clipShape(RoundedRectangle(cornerRadius: 15))//.listStyle(InsetGroupedListStyle())
                //.background(.green.opacity(0.1) ) //:Color .gray.opacity(0.1))
            }
            
            .onAppear() { self.viewModel.fetchData()}
            Button(action: {
                //self.showMenu()
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
        
        
        //.navigationBarItems(trailing:
        //                                    Button(action: {
        //                                        //self.presentationMode.wrappedValue.dismiss()
        //                                    }) {
        //                                        HStack {
        //                                            //Image(systemName: "arrow.left")
        //                                            Text("إضافة")//.foregroundColor(.red)
        //                                        }
        //                                })
        
        
        
    }
}

