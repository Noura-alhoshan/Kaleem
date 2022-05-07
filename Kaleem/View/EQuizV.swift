//
//  QuizView.swift
//  Kaleem
//
//  Created by نوره سعد on 26/06/1443 AH.
//
///*
import SwiftUI

struct EQuizV: View {
    @EnvironmentObject var quizManager1: EQuizManagerVM
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>

    var body: some View {

        if quizManager1.reachedEnd {
            NavigationView {

            
                
                VStack {
                        //  Spacer()
                    
                                              Image("Score")
                                                  .resizable()
                                                     .scaledToFit()
                                                     .frame(width: 280.0, height:280.0).padding(.top,-170 )
                    
                         Text( "لقد حصلت على "
                          + String(quizManager1.score*10) + "٪ في اختبار لغة الإشارة " )
                                .font(Font.custom("Almarai-Bold", size: 20))
                                .foregroundColor(Color.black.opacity(0.6))
                                .padding(.bottom,50)
 
                    
                    Button{
                        Task.init {                                            await quizManager1.fetchQuizRestart()
} }
                        label: {
                            Text("إعادة الأختبار")
                                .font(Font.custom("Almarai-Bold", size: 20))
                                .font(.title3)
                                .fontWeight(.bold)
                                .foregroundColor(Color.white)
                                .padding()
                                .frame(width: 300)
                                .background(Color("quiz"))
                                .cornerRadius(50.0)
                                .shadow(color: Color.black.opacity(0.08), radius: 60, x: 0.0, y: 16)
                                .padding(.vertical)
                        }
                    
                    NavigationLink(
                        destination: EQuizV().navigationBarHidden(true),
                        label: {
                            Text("الخروج")
                                .font(Font.custom("Almarai-Regular", size: 20))
                                .font(.title3)
                                .fontWeight(.bold)
                                .foregroundColor(Color("quiz"))
                                .padding()
                                .frame(width: 300)
                                .background(Color.gray.opacity(0.1))
                                .cornerRadius(50.0)
                                .shadow(color: Color.black.opacity(0.08), radius: 60, x: 0.0, y: 16)
                                .padding(.vertical)
                        }
                    )
                      
                  }
                  }
                            
                    
                    
                  }
        
                  
            
                 // .navigationBarTitle("")
         //
            
        
    
       else {
            EQuestionV()
               .environmentObject(quizManager1)
        }
        
    }
}


struct EQuizV_Previews: PreviewProvider {
    static var previews: some View {
        EQuizV()
            .environmentObject(EQuizManagerVM())
    }
}
// */

