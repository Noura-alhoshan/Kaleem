//
//  ProfileView.swift
//  Kaleem
//
//  Created by Sarah S on 15/03/2022.
//

import SwiftUI

struct ProfileView: View {
    @ObservedObject private var PViewModel = ProfileVM()

//    var body: some View {
//        VStack{
//        Text(PViewModel.KaleemUser.name)
//    }.onAppear(perform: {
//        PViewModel.fetchUser()
//    })
//    }
    
    var body: some View {
        
        ZStack(alignment: .bottomLeading) {//to hold the floating + button
           
            
        VStack(spacing: 30) {
            HStack{
                Spacer()
                Button(action: {
                                    
                                    withAnimation(.easeInOut){
                                      //  self.mode.wrappedValue.dismiss()
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
            
          
            VStack( spacing: 19) {

               // AsyncImage(url: URL(string: viewModel.oneQuestion.question), scale: 4.0).frame(width: 330, height: 180 )}

            Text(PViewModel.KaleemUser.name)
                    .font(.system(size: 20))
                    .bold()
                    .foregroundColor(.gray).multilineTextAlignment(.trailing)

               // ForEach(PViewModel.KaleemUser.phoneNo, id: \.id) { answer in
                    HStack(spacing: 20) {

                        Text(PViewModel.KaleemUser.phoneNo)
                            //.bold()

                    }
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .foregroundColor( .black.opacity(0.75))
                    //.background(viewModel.oneQuestion.correctAnswer == answer.text ? .green.opacity(0.1) :Color .gray.opacity(0.1))
                    .cornerRadius(10)
                    //.shadow(color: .gray, radius: 5, x: 0.5, y: 0.5)
                
            //}
            
            Spacer(minLength: 20)
            
        }.onAppear(perform: {
            PViewModel.fetchUser()
        })
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .trailing)
        .background(.white)
       //.navigationBarHidden(true)
            
            
            Button(action: {
                //showEditForm = true
            }) {
                Image(systemName: "pencil.circle.fill")
                    .resizable()
                    .frame(width: 80, height: 80)
                    .foregroundColor(Color("Kaleem"))
                    .shadow(color: .gray, radius: 0.2, x: 1, y: 1)
            }
                .padding()
            
        }.navigationBarTitle("")
         .navigationBarHidden(true)
    }
}

}
