//
//  VideoRecorder.swift
//  VideoCap
//

//
import UIKit
import AVFoundation
import SwiftUI
struct VideoRecordingView: UIViewRepresentable {
    
    @Binding var timeLeft: Int
    @Binding var onComplete: Bool
    @Binding var recording: Bool
    @Binding var recordingView:PreviewViewRecord
    func makeUIView(context: UIViewRepresentableContext<VideoRecordingView>) -> PreviewViewRecord {
        recordingView.onComplete = {
            self.onComplete = true
        }
        recordingView.onRecord = { timeLeft, totalShakes in
            self.timeLeft = timeLeft
            self.recording = true
        }
        recordingView.onReset = {
            self.recording = false
            self.timeLeft = 7
        }
        return recordingView
    }
    
    func updateUIView(_ uiViewController: PreviewViewRecord, context: UIViewRepresentableContext<VideoRecordingView>) {
        if recording {
            uiViewController.start()
        }
    }
}

extension PreviewViewRecord: AVCaptureFileOutputRecordingDelegate{
    func fileOutput(_ output: AVCaptureFileOutput, didFinishRecordingTo outputFileURL: URL, from connections: [AVCaptureConnection], error: Error?) {
        self.videoURL = outputFileURL
       
    }
}

class PreviewViewRecord: UIView {
    private var captureSession: AVCaptureSession?
    private var shakeCountDown: Timer?
    let videoFileOutput = AVCaptureMovieFileOutput()
    var recordingDelegate:AVCaptureFileOutputRecordingDelegate!
    var recorded = 0
    var secondsToReachGoal = 7
    var videoURL:URL?
    var onRecord: ((Int, Int)->())?
    var onReset: (() -> ())?
    var onComplete: (() -> ())?
    
    init() {
        super.init(frame: .zero)
        
        var allowedAccess = false
        let blocker = DispatchGroup()
        blocker.enter()
        AVCaptureDevice.requestAccess(for: .video) { flag in
            allowedAccess = flag
            blocker.leave()
        }
        blocker.wait()
        
        if !allowedAccess {
            return
        }
        
        // setup session
        let session = AVCaptureSession()
        session.beginConfiguration()
        
        let videoDevice = AVCaptureDevice.default(.builtInWideAngleCamera,
                                                  for: .video, position: .front)
        guard videoDevice != nil, let videoDeviceInput = try? AVCaptureDeviceInput(device: videoDevice!), session.canAddInput(videoDeviceInput) else {
            return
        }
        session.addInput(videoDeviceInput)
        session.commitConfiguration()
        self.captureSession = session
    }
    deinit{
        self.captureSession = nil
        self.removeFromSuperview()
    }
    
    override class var layerClass: AnyClass {
        AVCaptureVideoPreviewLayer.self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var videoPreviewLayer: AVCaptureVideoPreviewLayer {
        return layer as! AVCaptureVideoPreviewLayer
    }
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        recordingDelegate = self
    }
    
    func start() {
        startTimers()
        if nil != self.superview {
            self.videoPreviewLayer.session = self.captureSession
            self.videoPreviewLayer.videoGravity = .resizeAspect
            self.captureSession?.startRunning()
            self.startRecording()
        } else {
            self.captureSession?.stopRunning()
        }
    }
    private func onTimerFires(){
        secondsToReachGoal -= 1
        recorded += 1
        onRecord?(secondsToReachGoal, recorded)
        
        if(secondsToReachGoal == 0){
            stopRecording()
            shakeCountDown?.invalidate()
            shakeCountDown = nil
            onComplete?()
            videoFileOutput.stopRecording()
            self.captureSession?.stopRunning()
//            self.removeFromSuperview()
        }
    }
    
    func startTimers(){
        if shakeCountDown == nil {
            shakeCountDown = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] (timer) in
                self?.onTimerFires()
            }
        }
    }
    
    func startRecording(){
        captureSession?.addOutput(videoFileOutput)
        
        let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let filePath = documentsURL.appendingPathComponent("\(Date())")
        
        videoFileOutput.startRecording(to: filePath, recordingDelegate: recordingDelegate)
    }
    func stopRecording(){
        videoFileOutput.stopRecording()
        
    }
}
