//
//  Sentences.swift
//  Kaleem
//
//  Created by Raneem AlRashoud on 25/07/1443 AH.
//

//Loop depending on location list
//Change sentences.swift later; to have multible files that were named based on the spot name, or if statements


import SwiftUI

struct FavoriteListV: View {
    @ObservedObject private var FavObj  = SentencesVM()
    
 
    @AppStorage("currentPage1") var currentPage1 = 1
    
    
    //  @EnvironmentObject var sentDBVM: CoffeeVM
    init(){
        currentPage1 = 1
        
    }
    
    var body: some View {
        
        
        
        ZStack(alignment: .bottom, content: {
            Color.white
                .ignoresSafeArea()
            
            
            // Custom Tab Bar....
            ListviewFavorite()
                .environmentObject(FavObj)
        })
        
        
    }
}







struct ListviewFavorite: View {
    @EnvironmentObject var EnvFavObj: SentencesVM
    @ObservedObject private var FavObj  = SentencesVM()
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    var body: some View{
        
        
        let SentenceDBArray = [
            
            "رقم الصفحة؟",
            "أين قاعة الاختبار؟",
            "متى الاختبار؟",
            "هل أستطيع الخروج؟",
            "هل أستطيع استعارته قليلاً؟",
            
            
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
                        ForEach(FavObj.FavList){ album in
                            GeometryReader{ element in
                                FavAlbumView(album: album.Sentence ?? "", id: album.id ?? "", isFaved: album.isFaved ?? "")    
                                    .scaleEffect(FavDimensionValue (firstFrame: firtFrame.frame (in: .global).minY, minY: element.frame(in: .global).minY))
                                    .opacity (Double(FavDimensionValue(firstFrame: firtFrame.frame (in: .global).minY, minY: element.frame (in: .global).minY)))
                            }.frame(height: 100)
                        }
                    }.padding(.horizontal).padding(.top)
                }.zIndex (1.0)
                
            }  .onAppear(){
                self.FavObj.FavFetchData()
                
                
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
        @StateObject var speaker: Speaker = Speaker()
        @ObservedObject private var FavObj  = SentencesVM()
        var album: String
        var id: String
        var isFaved: String
        var body: some View{
            
            HStack{
                //trash icon --> delete sentence using FavObj ObservedObject
                Button( action: {
                    
                  
                    FavObj.removeFavSen(Sentence: album, isFaved: isFaved, docId: id)
                } , label: {
                    
                    
                    Image(systemName:"trash")
                        .font(.system (size: 25, weight: .semibold))
                        .foregroundColor(Color("Color"))
                    
                    
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
                
                
                
                
                Text  (album)
                    .foregroundColor(.black.opacity(0.6))
                    .font(Font.custom("Almarai-Regular", size: 20))
                    .multilineTextAlignment(.center)
                    .padding(.all)
                
                
                
                
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
