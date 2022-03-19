//
//  Sentences.swift
//  Kaleem
//
//  Created by Raneem AlRashoud on 25/07/1443 AH.
//

//Loop depending on location list
//Change sentences.swift later; to have multible files that were named based on the spot name, or if statements


import SwiftUI

struct IvCoffeeV: View {
    @ObservedObject private var sentDBVM  = CoffeeVM()
    
  //  @EnvironmentObject var sentDBVM: CoffeeVM
  
    var body: some View {
        

        
        ZStack(alignment: .bottom, content: {
            Color.white
                .ignoresSafeArea()
            
            
           // Custom Tab Bar....
            ListviewIvCoffeeV()
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





struct ListviewIvCoffeeV: View {
    @EnvironmentObject var sentDBVM: CoffeeVM
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    var body: some View{
      
        
        var SentenceDBArray = [
            sentDBVM.oneSentence.S1,
            sentDBVM.oneSentence.S2,
            sentDBVM.oneSentence.S3,
            sentDBVM.oneSentence.S4,
            sentDBVM.oneSentence.S5

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
                    
           
                  
                
            }.padding(.bottom,30)
                .padding(.top,-20)
            
           Spacer(minLength: 30)
            Text("أهلاً بك في مقهى Iv Speciality")
                .bold()
                .font(Font.custom("Almarai-Regular", size: 30))
                .foregroundColor(Color("Color"))
            
            Text("الجمل الأكثر استخداما في مقهى Iv ")
                .font(Font.custom("Almarai-Regular", size: 20))
             
                
    .foregroundColor(Color("DarkGray"))
            
 
            
            
            
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
                            self.sentDBVM.fetchData()
                            
                        }
            //end of GeometryReader
                       
                 
                    
                    
                }.navigationBarBackButtonHidden(true)

    
        
            

        } //end of GeometryReader
        
            
            
            
            
            

//
        
        
    }  //end of VStack
    


func IvDimensionValue(firstFrame: CGFloat, minY: CGFloat) -> CGFloat {
    withAnimation(.easeOut (duration: 1)){
        let dimension = (minY - 15) / firstFrame
        if dimension > 1 {
             return 1
          } else {
             return dimension
    }
    }
    
}
      
struct IvAlbumView: View {
    var album: String
    var body: some View{
        
        HStack{
            Spacer(minLength: 20)
            Image(systemName:"heart").font(.system (size: 25, weight: .semibold))
                .foregroundColor(Color("Color"))
            
            
            Image(systemName:"speaker").font(.system (size: 30, weight: .semibold))
                .foregroundColor(Color("Color"))
            Spacer()
            
            
            
            Text  (album).foregroundColor(.white) .font(Font.custom("Almarai-Regular", size: 20)).kerning (1.9).multilineTextAlignment(.trailing)
            
            
            Image ("HH").resizable().scaledToFit().frame (width: 60, height: 60).padding(10)
            
        }//HStack
        
        .foregroundColor(Color.black)
        .shadow(color: .black, radius:20, x: 30, y: 20)
        .background (Color.gray.shadow(color: .white.opacity(0.65), radius: 5, x: 0, y:2)).cornerRadius (20)
        //.shadow(color: .gray, radius:20, x: 30, y: 2)
        .zIndex(0)
        .padding( )
        
    }
    
}
                
struct IvCoffeeV_Previews: PreviewProvider {
    static var previews: some View {
        IvCoffeeV()
            .environmentObject(CoffeeVM())
    }
}




