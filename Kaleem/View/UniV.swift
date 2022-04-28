//
//  Sentences.swift
//  Kaleem
//
//  Created by Raneem AlRashoud on 25/07/1443 AH.
//

//Loop depending on location list
//Change sentences.swift later; to have multible files that were named based on the spot name, or if statements


import SwiftUI

struct UniV: View {
    @ObservedObject private var sentDBVM  = CoffeeVM()
    
  //  @EnvironmentObject var sentDBVM: CoffeeVM
  
    var body: some View {
        

        
        ZStack(alignment: .bottom, content: {
            Color.white
                .ignoresSafeArea()
            
            
           // Custom Tab Bar....
            UniviewSentencesV()
                .environmentObject(sentDBVM)
        })
        
   
    }
}



//struct SentenceDB {
//   var sentence: String
//  }
//
////Temp Array, later we will fetch directly
//
//





struct UniviewSentencesV: View {
    @EnvironmentObject var sentDBVM: CoffeeVM
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    var body: some View{
      
        
        let SentenceDBArray = [
            //they should be 5 sen
//            sentDBVM.UniOneSentence.S1,
//            sentDBVM.UniOneSentence.S2,
//            sentDBVM.UniOneSentence.S3,
//            sentDBVM.UniOneSentence.S4,
//            sentDBVM.UniOneSentence.S5,
//            sentDBVM.UniOneSentence.S6,
//            sentDBVM.UniOneSentence.S7,
//            sentDBVM.UniOneSentence.S8,
//            sentDBVM.UniOneSentence.S9,
//            sentDBVM.UniOneSentence.S10,
          "أين دورة المياة؟",
          "أين قاعة الاختبار؟",
          "متى الاختبار؟",
          "هل بإمكاني الخروج؟",
          "هل بإمكاني استعارة قلمك قليلاً؟",
          

        ]
 
        
        VStack{
            
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
                        // .background(Color.black.opacity(0.4))
                         .background(Color("Color"))
                         .cornerRadius(10)
                 
                }).padding(.horizontal,25)
           
                  
                
            }
            
           Spacer(minLength: 30)

            Text("الجمل الأكثر استخداماً في الجامعة")
                .font(Font.custom("Almarai-Regular", size: 25))
             
                
                .foregroundColor(.black.opacity(0.5))
            
            
                        GeometryReader{ firtFrame in
                             ScrollView(. vertical, showsIndicators: false) {
                                VStack{
                                    ForEach(SentenceDBArray, id: \.self){ album in
                                        GeometryReader{ element in
                                            AlbumView(album: album)
                                                 .scaleEffect(dimensionValue (firstFrame: firtFrame.frame (in: .global).minY, minY: element.frame(in: .global).minY))
                                                 .opacity (Double(dimensionValue(firstFrame: firtFrame.frame (in: .global).minY, minY: element.frame (in: .global).minY)))
                                        }.frame(height: 100)
                                    }
                                }.padding(.horizontal).padding(.top)
                            }.zIndex (1.0)
            
                        }  .onAppear(){
                            self.sentDBVM.UniFetchData()
                            
                        }
                        .navigationBarTitle("")
                                        .navigationBarHidden(true)
            //end of GeometryReader
                       
                 
                    
                    
                }.navigationBarBackButtonHidden(true)
        //.listStyle(InsetGroupedListStyle())
                //.background(.green.opacity(0.1) ) //:Color .gray.opacity(0.1))
        
            


        
        
    }  //end of VStack
    


func UniDimensionValue(firstFrame: CGFloat, minY: CGFloat) -> CGFloat {
    withAnimation(.easeOut (duration: 1)){
        let dimension = (minY - 15) / firstFrame
        if dimension > 1 {
             return 1
          } else {
             return dimension
    }
    }
    
}
      
struct UniAlbumView: View {
    var album: String
    var body: some View{
        
        HStack{
       
         Image(systemName:"heart").font(.system (size: 25, weight: .semibold))
                .foregroundColor(Color("Color"))
            
            
            Image(systemName:"speaker").font(.system (size: 30, weight: .semibold))
                .foregroundColor(Color("Color"))
                Spacer(minLength: 15)
                
     
       
            
            Text  (album)  .foregroundColor(.black.opacity(0.6)) .font(Font.custom("Almarai-Regular", size: 20))
                //.kerning (1.9)
                .multilineTextAlignment(.center)
                
                .padding(.all)
            
            
           // Image ("HH").resizable().scaledToFit().frame (width: 60, height: 60).padding(10)
            
        }//HStack
                        .navigationBarHidden(true)
        .foregroundColor(Color.black)
        //.shadow(color: .black, radius:20, x: 30, y: 20)
        .padding()
        .frame(maxWidth: .infinity, alignment: .trailing)
        .background (Color.gray.opacity(0.1).shadow(color: .white.opacity(0.65), radius: 5, x: 0, y:2)).cornerRadius (20)
       // .frame(width: 60, height: 60)
        //.shadow(color: .gray, radius:20, x: 30, y: 2)
       // .zIndex(0)
    
        
    }
    
}
                












}
