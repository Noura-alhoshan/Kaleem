//
//  ContentView.swift
//  VideoCap
//
//  Created by ali  on 18/03/2022.
//
import SwiftUI

struct ContentV: View {
    var rootView:root
    @Environment(\.dismiss) var dismiss
    @State var selectText = "التقط"
    @State var duration = 7
    @State var onComplete = false
    @State var recording = false
    @State var preview:PreviewViewRecord  = PreviewViewRecord()
    @State var isrecording = false
    @State var completed = false
    @State var started = false
    @State var recordingMessage = ""
    @State var timer:Timer = Timer()
    var body: some View {
        VStack{
            ZStack{
                VStack{
                    if !completed{
                        if recordingMessage == "جاري الالتقاط"{
                            ZStack{
                                CaptureView(duration: $duration, onComplete: $onComplete, recording: $onComplete, previewView: $preview)
                                Text(recordingMessage)
                                    .bold()
                                    .font(Font.system(size: 20))
                            }
                        }else{
                            Text(recordingMessage)
                        }
                    }
                }
                VStack {
                    ZStack{
                        Image("selection", bundle: Bundle.main)
                        Text("وجه على الاشارة")
                            .foregroundColor(Color.gray)
                    }
                    VStack{
                        
                    }.frame(width: 20, height: 70, alignment: .center)
                    VStack{
                        if !recording{
                            Button(selectText) {
                                selectText = "جاري الالتقاط"
                                makerCounter(numberOfSec: 5)
                                
//                                if !onComplete && !recordin
                                
                                    onComplete = true
                                    recording = true
                                    DispatchQueue.main.asyncAfter(deadline: .now()+13.5) {
                                        onComplete = false
                                        recording = false
                                        completed = true
                                        
                                        rootView.url = preview.videoURL
                                        dismiss()
                                    }
//                                }
                                }
                            .userActivity("", isActive: !recording, { _ in
                                
                            })
                            .foregroundColor(Color.white)
                            .frame(width: 120, height: 40, alignment: .center)
                            .background(Color.blue)
                            .cornerRadius(16)
                        }
                       // Text(recordingMessage)
                    }
                }.frame(width: UIScreen.screenWidth, height: UIScreen.screenHeight, alignment: .center)
                
            }

        }.frame(width: UIScreen.screenWidth, height: UIScreen.screenHeight, alignment: .center)
    }
    func makerCounter(numberOfSec:Int){
        if numberOfSec >= 0{
            recordingMessage = "سيتم البدء خلال \(numberOfSec)"
            DispatchQueue.main.asyncAfter(deadline: .now()+1) {
                makerCounter(numberOfSec: numberOfSec-1)
            }
        }else{
            recordingMessage = "جاري الالتقاط"
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentV(rootView: root())
    }
}
struct CaptureView:View{
    @Binding var duration:Int
    @Binding var onComplete:Bool
    @Binding var recording:Bool
    @Binding var previewView:PreviewViewRecord
    var body: some View{
        VideoRecordingView(timeLeft: $duration, onComplete: $onComplete, recording: $recording,recordingView: $previewView)
    }
}
extension UIScreen{
   static let screenWidth = UIScreen.main.bounds.size.width
   static let screenHeight = UIScreen.main.bounds.size.height
}
