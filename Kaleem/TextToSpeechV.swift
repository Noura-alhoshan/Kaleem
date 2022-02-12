//
//  TextToSpeechV.swift
//  Kaleem
//
//  Created by Sarah S on 08/07/1443 AH.
//

import SwiftUI
import AVFoundation


struct TextToSpeechV: View {
    
    @EnvironmentObject var session: SessionStore
    @State var TextToTranslate: String = ""
    @State var NoVoiceError = false
    @State var visulize = false
    @ObservedObject private var mic = MicrophoneMonitor(numberOfSamples: numberOfSamples)
      
     
     
    
    private func readText(_ text:String){
        
        if let language = NSLinguisticTagger.dominantLanguage(for: text) {
            let utterance = AVSpeechUtterance(string: text)
            utterance.voice = AVSpeechSynthesisVoice(language: language)

            //To control speed and pitch
           // utterance.pitchMultiplier = 1
          //  utterance.rate =

            let synth = AVSpeechSynthesizer()
            synth.speak(utterance)
            self.NoVoiceError = false
            self.visulize = true
            

        } else {
            print("Unknown language")
            self.NoVoiceError = true
            self.visulize = false
        }
        
        //mic.stopMonitoring()
        //self.visulize = true
    }

    
    
    private func errorVibration() {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.error)
    }
    
    
    private func normalizeSoundLevel(level: Float) -> CGFloat {
        let level = max(0.2, CGFloat(level) + 50) / 2 // between 0.1 and 25
        
        return CGFloat(level * (300 / 25)) // scaled to max at 300 (our height of our bar)
    }
    
    
    var body: some View {
        
        VStack{
        VStack{
               HStack(spacing: 15)  {
               TextField(" أدخل النص", text: self.$TextToTranslate
               )
                   .disableAutocorrection(true)
                   .autocapitalization(.none).multilineTextAlignment(TextAlignment.trailing)
                   
               }
            Divider()
               .background(Color("Kcolor").opacity(0.5))
            
           }
                   .padding(.horizontal)
                   .padding(.top,20)
                   .padding(.bottom,20)
               
            
            if (NoVoiceError) {
                       
                Text(" الرجاء إدخال نص صحيح")
                    .onAppear(perform: {let impactMed = UIImpactFeedbackGenerator(style: .medium)
                        impactMed.impactOccurred()})
                    //.offset(y: -10)
                    .foregroundColor(.red).padding(.top,13)
            }
            else {
                Text(" ").foregroundColor(.red).padding(.top,13)
                
            }
            
            if (visulize){
                
                HStack(spacing: 3) {
                             // 4
                            ForEach(mic.soundSamples, id: \.self) { level in
                                BarView(value: self.normalizeSoundLevel(level: level))
                                
                            }
                    
                        }
        
            }
            
            else{
                HStack(spacing: 3) {
                             // 4
                            
                        }
            }
            
            
               Button(action: {
                   readText(TextToTranslate)
                
                   if (NoVoiceError) {
                       UINotificationFeedbackGenerator().notificationOccurred(.error)
                   }
               }, label: {
                   Text("ترجمة ")
                       .font(.headline)
                       .foregroundColor(.white)
                       .padding()
                       .frame(width: 220, height: 60)
                       .background(Color.black)
                       .cornerRadius(35.0)
               })
    }
    }
}

struct TextToSpeechV_Previews: PreviewProvider {
    static var previews: some View {
        TextToSpeechV()
        
    }
}



let numberOfSamples: Int = 10

struct BarView: View {
   // 1
    var value: CGFloat

    var body: some View {
        ZStack {
           // 2
            RoundedRectangle(cornerRadius: 20)
                .fill(LinearGradient(gradient: Gradient(colors: [.purple, .blue]),
                                     startPoint: .top,
                                     endPoint: .bottom))
                // 3
                .frame(width: (UIScreen.main.bounds.width - CGFloat(numberOfSamples) * 4) / CGFloat(numberOfSamples), height: value)
        }
    }
}
