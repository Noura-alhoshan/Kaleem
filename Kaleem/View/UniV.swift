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
    @ObservedObject private var ObjUni  = SentencesVM()
    
    //  @EnvironmentObject var sentDBVM: CoffeeVM
    
    var body: some View {
        
        
        
        ZStack(alignment: .bottom, content: {
            Color.white
                .ignoresSafeArea()
            
            
            // Custom Tab Bar....
            UniviewSentencesV()
                .environmentObject(ObjUni)
        })
        
        
    }
}



struct UniviewSentencesV: View {
    @ObservedObject private var UniObj  = SentencesVM()
   // @EnvironmentObject var UniObjCoffee: SentencesVM
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    var body: some View{
        
        
        let SentenceArray = [
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
            "هل أستطيع الخروج؟",
            "هل أستطيع استعارة قلمك؟",
            
            
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
            .navigationBarTitle("")
            .navigationBarHidden(true)
            
            Spacer(minLength: 30)
            
            Text("الجمل الأكثر استخداماً في الجامعة")
                .font(Font.custom("Almarai-Regular", size: 25))
            
            
                .foregroundColor(.black.opacity(0.5))
            
            
            GeometryReader{ firtFrame in
                ScrollView(. vertical, showsIndicators: false) {
                    VStack{
                        ForEach(UniObj.uniList){ album in
                            GeometryReader{ element in
                                UniAlbumView(album: album.Sentence ?? "", id: album.id ?? "", isFaved: album.isFaved ?? "")                                    .scaleEffect(UniDimensionValue (firstFrame: firtFrame.frame (in: .global).minY, minY: element.frame(in: .global).minY))
                                    .opacity (Double(UniDimensionValue(firstFrame: firtFrame.frame (in: .global).minY, minY: element.frame (in: .global).minY)))
                            }.frame(height: 100)
                        }
                    }.padding(.horizontal).padding(.top)
                }.zIndex (1.0)
                
            }  .onAppear(){
                self.UniObj.UniFetchData()
                
            }
            //end of GeometryReader
            
            
            
            
        } .navigationBarTitle("")
            .navigationBarHidden(true).navigationBarBackButtonHidden(true)
        
        
        
        
        
        
        
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
        @StateObject var speaker: Speaker = Speaker()
        @ObservedObject private var UniObj  = SentencesVM()
        var album: String
        var id: String
        var isFaved: String
        var body: some View{
            
            HStack{
                Button( action: {
                    if(isFaved == "false"){
                        UniObj.addFavSen(Sentence: album, isFaved: isFaved, docId: id)}
                    
                   else{
                        UniObj.removeFavSen(Sentence: album, isFaved: isFaved, docId: id)}
                    
                } , label: {
                    if(isFaved == "false"){
                        Image(systemName:"heart")
                            .font(.system (size: 25, weight: .semibold))
                            .foregroundColor(Color("Color"))
                    }
                    else {
                        Image(systemName:"heart.fill")
                            .font(.system (size: 25, weight: .semibold))
                            .foregroundColor(Color("Color"))
                    }
                 
                    
                    
                })
            
                
                
                if (speaker.isSpeaking) {
                    Image(systemName:"speaker.fill").font(.system (size: 30, weight: .semibold))
                        .foregroundColor(Color("Color"))
                }
                else{
                    Image(systemName:"speaker").font(.system (size: 30, weight: .semibold))
                        .foregroundColor(Color("Color"))
                        .onTapGesture {
                            speaker.speak(album)//speaking action
                        }
                }
                Spacer(minLength: 15)
                
                
                
                
                Text  (album)  .foregroundColor(.black.opacity(0.6)) .font(Font.custom("Almarai-Regular", size: 20))
                //.kerning (1.9)
                    .multilineTextAlignment(.center)
                
                    .padding(.all)
                
                
            }//HStack
            .navigationBarTitle("")
                .navigationBarHidden(true)
            .navigationBarHidden(true)
            .foregroundColor(Color.black)
            .padding()
            .frame(maxWidth: .infinity, alignment: .trailing)
            .background (Color.gray.opacity(0.1).shadow(color: .white.opacity(0.65), radius: 5, x: 0, y:2)).cornerRadius (20)
            
            
            
        }
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
}
