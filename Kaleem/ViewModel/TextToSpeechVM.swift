import Foundation
import AVFoundation
import SwiftUI 

internal class Speaker: NSObject, ObservableObject {
    internal var errorDescription: String? = nil
    private let synthesizer: AVSpeechSynthesizer = AVSpeechSynthesizer()
    @Published var isSpeaking: Bool = false
    @Published var isShowingSpeakingErrorAlert: Bool = false

    override init() {
        super.init()
        self.synthesizer.delegate = self
    }

    internal func speak(_ text: String) {
        do {
            if let language = NSLinguisticTagger.dominantLanguage(for: text) {
            let utterance = AVSpeechUtterance(string: text)
            utterance.voice = AVSpeechSynthesisVoice(language: language)
            isShowingSpeakingErrorAlert = false
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            self.synthesizer.speak(utterance)
            }
            else {
                     print("Unknown language")
                isShowingSpeakingErrorAlert = true
                   }
            
        } catch let error {
            self.errorDescription = error.localizedDescription
            isShowingSpeakingErrorAlert.toggle()
        }
        
    }
        
    
    internal func stop() {
        self.synthesizer.stopSpeaking(at: .immediate)
    }
}
