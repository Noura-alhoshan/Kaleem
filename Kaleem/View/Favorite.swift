//
//  Sentences.swift
//  Kaleem
//
//  Created by Raneem AlRashoud on 25/07/1443 AH.
//

//Loop depending on location list
//Change sentences.swift later; to have multible files that were named based on the spot name, or if statements


import SwiftUI





//struct SentenceDB {
//   var sentence: String
//  }
//
////Temp Array, later we will fetch directly
//
//





struct Favorite: View {
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
           
           Spacer(minLength: 30)
            Text("المفضلة")
                .bold()
                .font(Font.custom("Almarai-Regular", size: 30))
                .foregroundColor(Color("Color"))
     
        
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
    


