//
//  TextToSpeechV.swift
//  Kaleem
//
//  Created by Sarah S on 08/07/1443 AH.
//

import SwiftUI
import AVFoundation



struct TextToSpeechV: View {
    
    @State var TextToTranslate: String = ""
    @StateObject var speaker: Speaker = Speaker()
    @State  var animateAquaColor =  false
    @State  var animateSkyColor = false
    
    
    
    private func errorVibration() {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.error)
    }
    
    
    var body: some View {
        
        VStack{
            VStack{
                HStack(spacing: 15)  {
                    
                    ZStack(alignment: .topTrailing) {
                        TextEditor(text: $TextToTranslate)
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
                        // .animation( Animation.easeInOut (duration:
                        // 8.5))
                        //value: speaker.isSpeaking ? true : false)
                            .onAppear() {
                                // self.animateSkyColor.toggle()
                                
                            }
                        
                        
                        Circle() // Aqua
                            .frame (width: 120, height: 120)
                            .foregroundColor(Color.teal).opacity(0.5)
                            .scaleEffect(animateSkyColor ? 1: 0.8)
                            .shadow(color: Color.gray.opacity(0.1), radius:5 , x: 0, y: 5)
                        // .animation(Animation.easeInOut(duration:
                        //  0.5)) //, value: speaker.isSpeaking ? true : false)
                            .onAppear() {
                                // self.animateAquaColor.toggle()
                                
                            }
                        
                        
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
                
            }
            
        } /*CONTAINER*/
        
        .padding()
        .padding(.bottom, 5)
        .background(Color.gray.opacity(0.1))
        .cornerRadius(15)
        .padding(.horizontal,20)
        .onTapGesture {
            self.hideKeyboard()
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
