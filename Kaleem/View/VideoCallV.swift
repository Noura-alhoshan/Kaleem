//
//
//
//import SwiftUI
import UIKit
import AgoraRtcKit
import AgoraUIKit_iOS
//
//
//struct BasicUIViewControllerRepresentable:
//    UIViewControllerRepresentable {
//
//    func makeUIViewController(context: Context) -> some
//        UIViewController {
//
//            return ViewController()
//
//    }
//    func updateUIViewController(_ uiViewController:
//        UIViewControllerType, context: Context) {
//    }
//}
//

class ViewController: UIViewController {


    var agoraView: AgoraVideoViewer?
    override func viewDidLoad() {
        super.viewDidLoad()

        var agSettings = AgoraSettings()
        agSettings.enabledButtons = [.cameraButton, .micButton, .flipButton, .beautifyButton, ]
        let agoraView = AgoraVideoViewer(
            connectionData: AgoraConnectionData(
                appId: "6ffe12dc3de04c8ea0eccb375f538705",
                rtcToken: "0066ffe12dc3de04c8ea0eccb375f538705IAC8a+T3TbxtDT+r1guTccYwYE2JZtPWDgywzJi+H9NdOYbGamQAAAAAEADnfDPKkZ05YgEAAQCRnTli"
            ),
            style: .grid,
            agoraSettings: agSettings

           // delegate: self
        )

      self.view.backgroundColor = .tertiarySystemBackground


        agoraView.fills(view: self.view)

        agoraView.join(channel: "Kaleem", as: .broadcaster) // id for volunteer

        self.agoraView = agoraView
        self.agoraView?.style =  AgoraVideoViewer.Style.grid

      


//        self.showSegmentedView()
    }
    override func viewDidAppear(_ animated: Bool) {
     //   var isMovingFromParent: Bool = false

        navigationController?.setNavigationBarHidden(false, animated: false)
        super.viewDidAppear(animated)
    }

    func showSegmentedView() {
        let segControl = UISegmentedControl(items: ["floating", "grid"])
        segControl.selectedSegmentIndex = 1
        segControl.addTarget(self, action: #selector(segmentedControlHit), for: .valueChanged)
        self.view.addSubview(segControl)
        segControl.translatesAutoresizingMaskIntoConstraints = false
        [
            segControl.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 10),
            segControl.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor, constant: -10)
        ].forEach { $0.isActive = true }
        self.view.bringSubviewToFront(segControl)
    }

    @objc func segmentedControlHit(segc: UISegmentedControl) {
        print(segc)
        let segmentedStyle = [
            AgoraVideoViewer.Style.floating,
            AgoraVideoViewer.Style.grid
        ][segc.selectedSegmentIndex]
        self.agoraView?.style = segmentedStyle
  }
   

}







////  VideoCallVM.swift
////  Kaleem
////
////  Created by Afnan Al-Zuayr on 24/07/1443 AH.
////
///* PLAN B*/
///*
///* This is the file where we will retrive volunteers list to make video call*/
//import Foundation
//import FirebaseFirestore
//
//class VideoCallVM: ObservableObject {
//
//    @Published var volunteers = [Volunteer]()
//
//    private var db = Firestore.firestore()
//
//    func fetchData() {
//        db.collection("Volunteer").addSnapshotListener { (querySnapshot, error) in
//            guard let documents = querySnapshot?.documents else {
//                print("No documents")
//                return
//            }
//
//            self.volunteers = documents.map { (queryDocumentSnapshot) -> Volunteer in
//                let data = queryDocumentSnapshot.data()
//                let username = data ["username"] as? String ?? "" /*WE NEED TO CHANGE IT TO NAME!*/
//                let phoneNo = data["phoneNo"] as? String ?? ""
//                return Volunteer(username: username, phoneNo: phoneNo)
//            }
//        }
//    }
//}
//*/
