//
//  Sentences.swift
//  Kaleem
//
//  Created by Raneem AlRashoud on 25/07/1443 AH.
//

//Loop depending on location list
//Change sentences.swift later; to have multible files that were named based on the spot name, or if statements


import SwiftUI

struct SentencesVM: View {
    @ObservedObject private var sentDBVM  = CoffeeVM()
    
  //  @EnvironmentObject var sentDBVM: CoffeeVM
  
    var body: some View {
        

        
        ZStack(alignment: .bottom, content: {
            Color.white
                .ignoresSafeArea()
            
            
           // Custom Tab Bar....
        ListviewSentencesV()
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





struct ListviewSentencesV: View {
    @EnvironmentObject var sentDBVM: CoffeeVM
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    var body: some View{
      
        
        let SentenceDBArray = [
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
           
                  
                
            }
            
           Spacer(minLength: 30)
            Text("أهلاً بك في مقهى Urban ")
                .bold()
                .font(Font.custom("Almarai-Regular", size: 30))
                .foregroundColor(Color("Color"))
            
            Text("الجمل الأكثر استخداما في مقهى Urban")
                .font(Font.custom("Almarai-Regular", size: 20))
             
                
                .foregroundColor(.black.opacity(0.5))
            
        
           // List(self.coffee.sentencesArray, id: \.self) { Qmodel in
            
                
                    
//                    VStack {
//
//
//
//
//
//                                Spacer()
//                        HStack {
//                            Text(sentDBVM.oneSentence.S1)
//                                        .foregroundColor( .black.opacity(0.5))
//                                        .padding(.trailing, 6)
//                                    .multilineTextAlignment(TextAlignment.trailing)
//
//                            Image(systemName: "checkmark").font(.title.weight(.semibold)) .foregroundColor(.green) .padding(.trailing, 4) } .padding(.top, -500)
//
//
//
//
//
//                        HStack{    Text(sentDBVM.oneSentence.S2)
//                                    .foregroundColor( .black.opacity(0.5))
//                                    .padding(.trailing, 6)
//                                    .multilineTextAlignment(TextAlignment.trailing)
//                                Image(systemName: "checkmark").font(.title.weight(.semibold)) .foregroundColor(.green) .padding(.trailing, 4)
//
//                        }
//
//
//                        }        .onAppear(){
//                            self.sentDBVM.fetchData()
//
//                        }
//               .clipShape(RoundedRectangle(cornerRadius: 15))
            
            
            
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
                        .navigationBarTitle("")
                                        .navigationBarHidden(true)
            //end of GeometryReader
                       
                 
                    
                    
                }.navigationBarBackButtonHidden(true)
        //.listStyle(InsetGroupedListStyle())
                //.background(.green.opacity(0.1) ) //:Color .gray.opacity(0.1))
        
            
/******************/
//            //Text("placeholder")
//            VStack{
//                if let coffee = sentDBVM.coffee {
//                    ForEach(coffee.sentencesArray, id: \.self){ sentence in
//                        GeometryReader{ element in
//                            Text(sentence)
//                        }.frame(height: 100)
//                    }
//                } else {
//                    Text("not laoded")
//                }
//
//            }.padding(.horizontal).padding(.top)
//                .onAppear(){
//                    self.sentDBVM.fetchData()
//
//                }
            
 /**************************/
    
        
            
//            GeometryReader{ firtFrame in
//                 ScrollView(. vertical, showsIndicators: false) {
//                    VStack{
//                        ForEach(SentenceDBArray, id: \.sentence){ album in
//                            GeometryReader{ element in
//                                AlbumView(album: album)
//                                     .scaleEffect(dimensionValue (firstFrame: firtFrame.frame (in: .global).minY, minY: element.frame(in: .global).minY))
//                                     .opacity (Double(dimensionValue(firstFrame: firtFrame.frame (in: .global).minY, minY: element.frame (in: .global).minY)))
//                            }.frame(height: 100)
//                        }
//                    }.padding(.horizontal).padding(.top)
//                }.zIndex (1.0)

        } //end of GeometryReader
        
            
            
            
            
            
            
//
//            GeometryReader{ firtFrame in
//                 ScrollView(. vertical, showsIndicators: false) {
//                    VStack{
//                        ForEach(SentenceDBArray, id: \.sentence){ album in
//                            GeometryReader{ element in
//                                AlbumView(album: album)
//                                     .scaleEffect(dimensionValue (firstFrame: firtFrame.frame (in: .global).minY, minY: element.frame(in: .global).minY))
//                                     .opacity (Double(dimensionValue(firstFrame: firtFrame.frame (in: .global).minY, minY: element.frame (in: .global).minY)))
//                            }.frame(height: 100)
//                        }
//                    }.padding(.horizontal).padding(.top)
//                }.zIndex (1.0)
//
//        } //end of GeometryReader
//
        
        
    }  //end of VStack
    


func dimensionValue(firstFrame: CGFloat, minY: CGFloat) -> CGFloat {
    withAnimation(.easeOut (duration: 1)){
        let dimension = (minY - 15) / firstFrame
        if dimension > 1 {
             return 1
          } else {
             return dimension
    }
    }
    
}
      
struct AlbumView: View {
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
                
struct SentencesV_Previews: PreviewProvider {
    static var previews: some View {
        SentencesVM()
            .environmentObject(CoffeeVM())
    }
}













//            HStack{
//             Spacer(minLength: 20)
//                Image(systemName:"heart").font(.system (size: 30, weight: .semibold))
//                    .foregroundColor(Color("Color"))
//                    //.padding(.all,15)
//
//                Image(systemName:"speaker").font(.system (size: 30, weight: .semibold))
//                    .foregroundColor(Color("Color"))
//                 Spacer()
//
//                Text ("أريد حجز موعد").foregroundColor(.white) .font(Font.custom("Almarai-Regular", size: 20)) .kerning (1.9)
//
//
//                Image ("HH").resizable().scaledToFit().frame (width: 60, height: 60).padding(10)
//
//            }//HStack
//            .foregroundColor(Color.black)
//            .background (Color.gray.shadow(color: .white.opacity(0.65), radius: 5, x: 0, y:2)).cornerRadius (20)
//             .zIndex(0)
//             .padding( )
// Spacer(minLength: 200)
