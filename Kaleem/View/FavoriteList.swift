//
//  Sentences.swift
//  Kaleem
//
//  Created by Raneem AlRashoud on 25/07/1443 AH.
//

//Loop depending on location list
//Change sentences.swift later; to have multible files that were named based on the spot name, or if statements


import SwiftUI

struct Favorite: View {
    @ObservedObject private var sentDBVM  = CoffeeVM()
    
  //  @EnvironmentObject var sentDBVM: CoffeeVM
  
    var body: some View {
        

        
        ZStack(alignment: .bottom, content: {
            Color.white
                .ignoresSafeArea()
            
            
           // Custom Tab Bar....
            ListviewFavorite()
                .environmentObject(sentDBVM)
        })
        
   
    }
}







struct ListviewFavorite: View {
    @EnvironmentObject var sentDBVM: CoffeeVM
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    var body: some View{
      
        
        let SentenceDBArray = [
            
       "رقم الصفحة؟",
            "أين قاعة الاختبار؟",
            "متى الاختبار؟",
            "هل بإمكاني الخروج؟",
            "هل بإمكاني استعارته قليلاً؟",
            

        ]
 
        
        VStack{
            
   
            
           Spacer(minLength: 30)
       Text("المفضلة")
                .bold()
                .font(Font.custom("Almarai-Regular", size: 40))
                .foregroundColor(Color("Color"))
     
            

            
            
            
                        GeometryReader{ firtFrame in
                             ScrollView(. vertical, showsIndicators: false) {
                                VStack{
                                    ForEach(SentenceDBArray, id: \.self){ album in
                                        GeometryReader{ element in
                                            FavAlbumView(album: album)
                                                 .scaleEffect(FavDimensionValue (firstFrame: firtFrame.frame (in: .global).minY, minY: element.frame(in: .global).minY))
                                                 .opacity (Double(FavDimensionValue(firstFrame: firtFrame.frame (in: .global).minY, minY: element.frame (in: .global).minY)))
                                        }.frame(height: 100)
                                    }
                                }.padding(.horizontal).padding(.top)
                            }.zIndex (1.0)
            
                        }  .onAppear(){
                            self.sentDBVM.fetchData()
                            
                        }
                        .navigationBarTitle("")
                                        .navigationBarHidden(true)
            //end of GeometryReader
                       
                 
                    
                    
                }.navigationBarBackButtonHidden(true)


        
        
    }  //end of VStack
    


func FavDimensionValue(firstFrame: CGFloat, minY: CGFloat) -> CGFloat {
    withAnimation(.easeOut (duration: 1)){
        let dimension = (minY - 15) / firstFrame
        if dimension > 1 {
             return 1
          } else {
             return dimension
    }
    }
    
}
      
struct FavAlbumView: View {
    var album: String
    var body: some View{
        
        HStack{
       
         Image(systemName:"heart.fill").font(.system (size: 25, weight: .semibold))
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
