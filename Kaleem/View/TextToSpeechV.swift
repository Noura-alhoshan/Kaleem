//
//  TextToSpeechV.swift
//  Kaleem
//
//  Created by Sarah S on 08/07/1443 AH.
//

import SwiftUI
import AVFoundation
import Foundation
import Combine


struct TextToSpeechV: View {
    
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @State var TextToTranslate: String = ""
    @StateObject var speaker: Speaker = Speaker()
    @State  var animateAquaColor =  false
    @State  var animateSkyColor = false
    
    let TextLimit = 100
    
    private func errorVibration() {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.error)
    }
    
    func limitText(_ upper: Int ) {
           if TextToTranslate.count > upper {
               TextToTranslate = String(TextToTranslate.prefix(upper))
           }
       }
    
    var body: some View {
        
       // GeometryReader{_ in
       //     VStack{
            HStack{
                Text("الترجمة الصوتية")
                    .foregroundColor(.black.opacity(0.7))
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.horizontal,22)
                    .padding(.top,12)

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
                                         .background(Color("Kcolor"))
                                         .cornerRadius(10)
                                 
                                }).padding(.horizontal,25)
                
            }
            
        //    }
        .padding(.bottom, 70)/////////////////here to change the space between arrow and gray box
        
     // Spacer(minLength: 160)/////////////////here to change the
   GeometryReader{_ in
   
       VStack{
            VStack(alignment: .trailing){
            Text("تعليمات الإدخال:")
                .font(.title2)
                .foregroundColor(Color("Kaleem"))
                .padding(.bottom, 5)
            Text("أدخل نص ينتمي إلى لغة واحدة:").foregroundColor(.black.opacity(0.7))
            Text("✔️ أريد حجز تذكرة").foregroundColor(.black.opacity(0.6))
            Text("❌ أريد حجز ticket").foregroundColor(.black.opacity(0.6))
                Divider()
            }
                HStack(spacing: 15)  {
                    
                    ZStack(alignment: .topTrailing) {
                        TextEditor(text: $TextToTranslate)
                            .onReceive( Just(TextToTranslate)) { _ in limitText(TextLimit) }
                            .multilineTextAlignment(TextAlignment.trailing)
                            .disableAutocorrection(true)
                            .autocapitalization(.none)
                            .font(.system(size: 18.5))
                            .background(Color.gray.opacity(0.1))
                            .frame(height: 130)
                        
                        // .padding()
                        //.border(Color(uiColor: .opaqueSeparator), width: 0.5)
                            .cornerRadius(15)
                            .shadow(color: Color.gray.opacity(0.1), radius:5 , x: 0, y: 5)
                            .onTapGesture {
                                //self.hideKeyboard()
                            }
                        //Spacer()
                        Text("أدخل النص")
                            .fontWeight(.light)
                            .foregroundColor(.black.opacity(0.25))
                            .font(.system(size: 18.5))
                        //.multilineTextAlignment(TextAlignment.trailing)
                        // .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .trailing)
                            .padding(8).hidden(!TextToTranslate.isEmpty)
                    }
                    
                    
                }
                
                
                //.padding(.horizontal)
                .padding(.top,20)
                //.padding(.bottom,20)
                
                
                if (speaker.isShowingSpeakingErrorAlert) {
                    
                    Text(" الرجاء إدخال نص صحيح")
                        .foregroundColor(.red).padding(.top,10)
                }
                else {
                    Text(" ").foregroundColor(.red).padding(.top,10)
                    
                }
                
                
                
                
                if (speaker.isSpeaking) {
                    SpeechStack()
                }
                else {
                    ZStack
                    {
                        Circle() // Sky
                            .frame(width: 120, height: 120)
                            .foregroundColor(Color.red).opacity(0.1)
                            .scaleEffect(animateSkyColor ? 1: 0.8)
                            .shadow(color: Color.gray.opacity(0.1), radius:5 , x: 0, y: 5)
                         // .onAppear() { self.animateSkyColor.toggle()  }
                        
                        Circle() // Aqua
                            .frame (width: 120, height: 120)
                            .foregroundColor(Color.teal).opacity(0.5)
                            .scaleEffect(animateSkyColor ? 1: 0.8)
                            .shadow(color: Color.gray.opacity(0.1), radius:5 , x: 0, y: 5)
                          // .onAppear() { self.animateAquaColor.toggle() }
                         
                        Button(action: {
                            speaker.speak(TextToTranslate)
                            if (speaker.isShowingSpeakingErrorAlert) {
                                UINotificationFeedbackGenerator().notificationOccurred(.error)
                            }
                            self.hideKeyboard()
                        }, label: {
                            Image(systemName: "speaker.wave.2.circle")
                                .resizable()
                                .frame(width: 55, height: 55).colorMultiply(Color.red)
                                .shadow(color: Color.gray.opacity(0.2), radius:5 , x: 0, y: 5)
                        })
                        
                    }
                }
        
    
        } /*CONTAINER big vstack */
        
        .padding()
        .padding(.bottom, 5)
        .background(Color.gray.opacity(0.1))
        .cornerRadius(15)
        .padding(.horizontal,20)
        .onTapGesture {
            self.hideKeyboard()
        }
        .navigationBarTitle("")
         .navigationBarHidden(true)
        }
    }
    
}



struct SpeechStack: View {
    
    @State  var animateAquaColor =  false
    @State  var animateSkyColor = false
    
    var body: some View {
        
        ZStack
        {
            Circle() // Sky Animation.default.repeat(while: active))
                .frame(width: 120, height: 120)
                .foregroundColor(Color.gray).opacity(0.19)
                .scaleEffect(animateSkyColor ? 1: 0.8)
                .animation( Animation.easeInOut (duration:
                                                    6.5).repeatForever(autoreverses: true).speed(2))
            
            Circle() // Sky Animation.default.repeat(while: active))
                .frame(width: 120, height: 120)
                .foregroundColor(Color.green).opacity(0.2)
                .scaleEffect(animateSkyColor ? 1: 0.8)
                .shadow(color: Color.gray.opacity(0.1), radius:5 , x: 0, y: 5)
                .scaleEffect(animateSkyColor ? 1: 0.8)
                .animation( Animation.easeInOut (duration:
                                                    2.5).repeatForever(autoreverses: true).speed(2))
            //value: speaker.isSpeaking ? true : false)
                .onAppear() {
                    self.animateSkyColor.toggle()
                    
                }
            
            
            Circle() // Aqua
                .frame (width: 120, height: 120)
                .foregroundColor(Color("Kcolor")).opacity(0.2)
                .scaleEffect(animateSkyColor ? 1: 0.8)
                .animation(Animation.easeInOut(duration:
                                                0.75).repeatForever(autoreverses: true).speed(2)) //, value: speaker.isSpeaking ? true : false)
                .onAppear() {
                    self.animateAquaColor.toggle()
                    
                }
            
            Image(systemName: "speaker.wave.2.circle")
                .resizable()
                .frame(width: 55, height: 55)
        }
        
        
    }
}


extension View {
    @ViewBuilder public func hidden(_ shouldHide: Bool) -> some View {
        switch shouldHide {
        case true: self.hidden()
        case false: self
        }
    }
}

#if canImport(UIKit)
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif


struct TextToSpeechV_Previews: PreviewProvider {
    static var previews: some View {
        TextToSpeechV()
        
    }
}
