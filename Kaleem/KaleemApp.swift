////
////  AppDelegate.swift
////  narutoOneSignalDemo
////
////  Created by Naruto on 6/21/18.
////  Copyright © 2018 Naruto. All rights reserved.
////
//import SwiftUI
//import OneSignal
//import FirebaseCore
//import FirebaseMessaging
////import FirebaseInstanceID
//import UserNotifications
//@main
//struct KaleemApp: App {
//    // not in evelt
//    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
//
//
////   init(){
////       FirebaseApp.configure()
////    }
//
//    var body: some Scene {
//
//        WindowGroup {
//           // let viewModel = AppViewModel()
//            Wrraper().environmentObject(SessionStore())
//
//        }
//    }
//}
//
//
////@UIApplicationMain
//class AppDelegate: UIResponder, UIApplicationDelegate, UNUserNotificationCenterDelegate, OSPermissionObserver, OSSubscriptionObserver { // Add OSPermissionObserver after UIApplicationDelegate
//    // Add OSSubscriptionObserver after UIApplicationDelegate
//    
//    var window: UIWindow?
//    
//    // replase the text down with your oneSignal App ID : ########################################
//    let oneSignailAppID = "d45efc52-3e88-442c-b3a9-8c50061e5740"
//    
//    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
//        
//        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { (isGranted, err) in
//            if err != nil {
//                //Something bad happend
//            } else {
//                UNUserNotificationCenter.current().delegate = self
//                
//                DispatchQueue.main.async {
//                    UIApplication.shared.registerForRemoteNotifications()
//                }
//            }
//        }
//        
//        // For debugging
//        //OneSignal.setLogLevel(.LL_VERBOSE, visualLevel: .LL_NONE)
//        
//        let notificationReceivedBlock: OSHandleNotificationReceivedBlock = { notification in
//            
//            print("Received Notification: \(notification!.payload.notificationID)")
//            print("launchURL = \(notification?.payload.launchURL ?? "None")")
//            print("content_available = \(notification?.payload.contentAvailable ?? false)")
//        }
//        
//        let notificationOpenedBlock: OSHandleNotificationActionBlock = { result in
//            // This block gets called when the user reacts to a notification received
//            let payload: OSNotificationPayload? = result?.notification.payload
//            
//            print("Message = \(payload!.body)")
//            print("badge number = \(payload?.badge ?? 0)")
//            print("notification sound = \(payload?.sound ?? "None")")
//            
//            if let additionalData = result!.notification.payload!.additionalData {
//                print("additionalData = \(additionalData)")
//                
//                
//                if let actionSelected = payload?.actionButtons {
//                    print("actionSelected = \(actionSelected)")
//                }
//                
//                // DEEP LINK from action buttons
//                if let actionID = result?.action.actionID {
//                    
//                    // For presenting a ViewController from push notification action button
//                    let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
//                    let instantiateRedViewController : UIViewController = mainStoryboard.instantiateViewController(withIdentifier: "RedViewControllerID") as UIViewController
//                    let instantiatedGreenViewController: UIViewController = mainStoryboard.instantiateViewController(withIdentifier: "GreenViewControllerID") as UIViewController
//                    self.window = UIWindow(frame: UIScreen.main.bounds)
//                    
//                    print("actionID = \(actionID)")
//                    
//                    if actionID == "id2" {
//                        print("do something when button 2 is pressed")
//                        self.window?.rootViewController = instantiateRedViewController
//                        self.window?.makeKeyAndVisible()
//                        
//                        
//                    } else if actionID == "id1" {
//                        print("do something when button 1 is pressed")
//                        self.window?.rootViewController = instantiatedGreenViewController
//                        self.window?.makeKeyAndVisible()
//                        
//                    }
//                }
//            }
//        }
//        
//        let onesignalInitSettings = [kOSSettingsKeyAutoPrompt: false, kOSSettingsKeyInAppLaunchURL: true, ]
//        
//        OneSignal.initWithLaunchOptions(launchOptions, appId: oneSignailAppID, handleNotificationReceived: notificationReceivedBlock, handleNotificationAction: notificationOpenedBlock, settings: onesignalInitSettings)
//        
//        OneSignal.inFocusDisplayType = OSNotificationDisplayType.notification
//        
//        // Add your AppDelegate as an obsserver
//        OneSignal.add(self as OSPermissionObserver)
//        
//        OneSignal.add(self as OSSubscriptionObserver)
//        
//        
//        
//        FirebaseApp.configure()
//        return true
//    }
//    
//    // Add this new method
//    func onOSPermissionChanged(_ stateChanges: OSPermissionStateChanges!) {
//        
//        // Example of detecting answering the permission prompt
//        if stateChanges.from.status == OSNotificationPermission.notDetermined {
//            if stateChanges.to.status == OSNotificationPermission.authorized {
//                print("Thanks for accepting notifications!")
//            } else if stateChanges.to.status == OSNotificationPermission.denied {
//                print("Notifications not accepted. You can turn them on later under your iOS settings.")
//            }
//        }
//        // prints out all properties
//        print("PermissionStateChanges: \n\(stateChanges)")
//    }
//    
//    
//    // TODO: update docs to change method name
//    // Add this new method
//    func onOSSubscriptionChanged(_ stateChanges: OSSubscriptionStateChanges!) {
//        if !stateChanges.from.subscribed && stateChanges.to.subscribed {
//            print("Subscribed for OneSignal push notifications!")
//        }
//        print("SubscriptionStateChange: \n\(stateChanges)")
//    }
//    
//}
