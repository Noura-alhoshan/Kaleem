//
//  KaleemApp.swift
//  Kaleem
//
//  Created by نوره سعد on 21/06/1443 AH.
//


import SwiftUI
import Firebase
import Firebase
import UserNotifications
import FirebaseMessaging

@main
struct KaleemApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self)
      var appDelegate

    
//   init(){
//       FirebaseApp.configure()
//    }
////
    ///
    var body: some Scene {
        
        WindowGroup {
           // let viewModel = AppViewModel()
            Wrraper().environmentObject(SessionStore())
            
        }
    }
}
class AppDelegate: NSObject, UIApplicationDelegate {
   let gcmMessageIDKey = "gcm.message_id"

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        //Override point for customization after application lunch
        FirebaseApp.configure()
        
     //   setCategories()
        Messaging.messaging().delegate = self

        
        if #available(iOS 10.0, *) {
          // For iOS 10 display notification (sent via APNS)
          UNUserNotificationCenter.current().delegate = self

          let authOptions: UNAuthorizationOptions = [.alert, .badge, .sound]
          UNUserNotificationCenter.current().requestAuthorization(
            options: authOptions,
            completionHandler: {_, _ in })
        } else {
          let settings: UIUserNotificationSettings =
          UIUserNotificationSettings(types: [.alert, .badge, .sound], categories: nil)
          application.registerUserNotificationSettings(settings)
        }

        application.registerForRemoteNotifications()
        return true
    }

    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable: Any],
                     fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {

      if let messageID = userInfo[gcmMessageIDKey] {
        print("Message ID: \(messageID)")
      }

      print(userInfo)

      completionHandler(UIBackgroundFetchResult.newData)
    }
    
    //Custom actions
    func setCategories(){
        //ACTION1
        let acceptAction = UNNotificationAction(identifier: "accept.action", title: "Accept", options:[UNNotificationActionOptions(rawValue: 0)] )
        //ACTION2
        let rejectAction = UNNotificationAction(identifier: "reject.action",
                                              title: "Reject",
                                                options: [.foreground])
        // Register the notification categories.
        let kCategory = UNNotificationCategory(identifier: "kaleem.category", actions: [acceptAction, rejectAction], intentIdentifiers: [] , options: [])
        UNUserNotificationCenter.current().setNotificationCategories([kCategory])
    }
}

 var isFromNotif: Bool = false

extension AppDelegate: MessagingDelegate {
    
    func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String?) {
      let deviceToken:[String: String] = ["token": fcmToken ?? ""]
        print("Device token: ", deviceToken) // This token can be used for testing notifications on FCM
    }
    
    func application(application: UIApplication,
                         didRegisterForRemoteNotificationsWithDeviceToken deviceToken: NSData ) {
        Messaging.messaging().apnsToken = deviceToken  as! Data
        }
}


@available(iOS 10, *)
extension AppDelegate : UNUserNotificationCenterDelegate {

  // Receive displayed notifications for iOS 10 devices.
  func userNotificationCenter(_ center: UNUserNotificationCenter,
                              willPresent notification: UNNotification,
    withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
    let userInfo = notification.request.content.userInfo

    if let messageID = userInfo[gcmMessageIDKey] {
        print("Message ID: \(messageID)")
    }
    print(userInfo)

    // Change this to your preferred presentation option
    completionHandler([[.banner, .list, .sound]])
  }

    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {

    }

    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {

    }

  func userNotificationCenter(_ center: UNUserNotificationCenter,
                              didReceive response: UNNotificationResponse,
                              withCompletionHandler completionHandler: @escaping () -> Void) {
// newly added
//      let action = response.actionIdentifier
//      let request = response.notification.request
//      if action == "accept.action"{
//          let acceptTrigger = UNTimeIntervalNotificationTrigger(timeInterval: 5.0, repeats: false)
//          let acceptRequest = UNNotificationRequest(identifier: "kaleem.accept", content: request.content, trigger: acceptTrigger)
//          UNUserNotificationCenter.current().add(acceptRequest, withCompletionHandler: {(error) in
//              if error != nil {
//                  print("Accept Error!:\(error?.localizedDescription)")
//              }
//          })
//      }
    //
      isFromNotif = true
      
    let userInfo = response.notification.request.content.userInfo
    if let messageID = userInfo[gcmMessageIDKey] {
      print("Message ID from userNotificationCenter didReceive: \(messageID)")
    }

    print(userInfo)
      print("Value after noti is:!!!!!!!!!!!!!!\(isFromNotif)")
      

    completionHandler()
  }
    /* to handel tap*/
    private func coordinateToSomeVC()
    {
        guard let window = UIApplication.shared.keyWindow else { return }

        let storyboard = UIStoryboard(name: "YourStoryboard", bundle: nil)
        let yourVC = storyboard.instantiateViewController(identifier: "yourVCIdentifier")
        
        let navController = UINavigationController(rootViewController: yourVC)
        navController.modalPresentationStyle = .fullScreen

        // you can assign your vc directly or push it in navigation stack as follows:
        window.rootViewController = navController
        window.makeKeyAndVisible()
    }
}

