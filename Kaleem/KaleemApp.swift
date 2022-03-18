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
import FirebaseCore


@main
struct KaleemApp: App {
    // not in evelt
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
    // not
   let gcmMessageIDKey = "gcm.message_id"
    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]?) -> Bool {
        print("in kaleem app 1 :")
        //Override point for customization after application lunch
        FirebaseApp.configure()
        /*Sara  added*/
        //For Push notification implementation
//        HSAPNSHelper.shared.registerForPushNotification(application: application)
//        return true
        /*  */
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

        registerForRemoteNotifications()
        return true
    }
    // evalet
    func registerForRemoteNotifications() {
        print("in kaleem app 2 :")
        UNUserNotificationCenter.current().delegate = self
        let authOptions: UNAuthorizationOptions = [.alert, .badge, .sound]
        UNUserNotificationCenter.current().requestAuthorization(
            options: authOptions,
            completionHandler: { _, _ in }
            
        )
        // self ?
        UIApplication.shared.registerForRemoteNotifications()
    }
    
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        print("in kaleem app 3 :")
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        print("in kaleem app 4 :")
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
   
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        print("in kaleem app 5 :")
        print(userInfo)
    }
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any]) {
        print("in kaleem app 6:  \(userInfo)")
        /*from google*/
        Messaging.messaging().appDidReceiveMessage(userInfo)
     //   completionHandler(.noData)
    }
    // end Evalet
    //Custom actions
    func setCategories(){
        print("in kaleem app 7 :")
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
        print("in kaleem app 8 :")
      let deviceToken:[String: String] = ["token": fcmToken ?? ""]
        print("Device token: ", deviceToken) // This token can be used for testing notifications on FCM
    }

}


@available(iOS 10, *)
extension AppDelegate : UNUserNotificationCenterDelegate {

//  // Receive displayed notifications for iOS 10 devices.
//  func userNotificationCenter(_ center: UNUserNotificationCenter,
//                              willPresent notification: UNNotification,
//    withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
//      print("in kaleem app 9 :")
//    let userInfo = notification.request.content.userInfo
//   print("Well don! I am the userNotificationCenter@@@@@@@@")
//    if let messageID = userInfo[gcmMessageIDKey] {
//        print("Message ID: \(messageID)")
//    }
//    print(userInfo)
//
//          /*Afnan*s part to handel message tapping
//         let storyBoard: UIStoryboard = UIStoryboard(name: "VideoCallSV", bundle: nil)
//         let presentViewController = storyBoard.instantiateViewController(withIdentifier: "self.restorationIdentifier")
//
//         presentViewController.yourDict = userInfo //pass userInfo data to viewController
//         self.window?.rootViewController = presentViewController*/
//
//
//      // Change this to your preferred presentation option
//    completionHandler([[.banner, .list, .sound]])
//  }
    
// evalet
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        print("in kaleem app 9 :")
        print("Well don! I am the userNotificationCenter@@@@@@@@")
        let userInfo = notification.request.content.userInfo
        print(userInfo)
        /*from google*/
        Messaging.messaging().appDidReceiveMessage(userInfo)

        if #available(iOS 14.0, *) {
            completionHandler([.banner, .badge, .sound])
        } else {
            completionHandler([.alert, .badge, .sound])
        }
    }
    // end evalet
    
   

    
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        /*from google*/
        Messaging.messaging().apnsToken = deviceToken;
        print("in kaleem app 10 :")
//        let tokenParts = deviceToken.map { data in String(format: "%02.2hhx", data) }
//        let token = tokenParts.joined()
//        print("Device Token: \(token)")
  


    }

    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        print("in kaleem app 11 :")
        print("IN KaleemApp Failed to register: \(error)")
    }


  func userNotificationCenter(_ center: UNUserNotificationCenter,
                              didReceive response: UNNotificationResponse,
                              withCompletionHandler completionHandler: @escaping () -> Void) {
      print("in kaleem app 12 :")

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
        print("in kaleem app 13 :")
      print("Message ID from userNotificationCenter didReceive: \(messageID)")
    }

    print(userInfo)
      print("Value after noti is:!!!!!!!!!!!!!!\(isFromNotif)")


    completionHandler()
  }



//    /* to handel tap*/
//    private func coordinateToSomeVC()
//    {
//        guard let window = UIApplication.shared.keyWindow else { return }
//
//        let storyboard = UIStoryboard(name: "YourStoryboard", bundle: nil)
//        let yourVC = storyboard.instantiateViewController(identifier: "yourVCIdentifier")
//
//        let navController = UINavigationController(rootViewController: yourVC)
//        navController.modalPresentationStyle = .fullScreen
//
//        // you can assign your vc directly or push it in navigation stack as follows:
//        window.rootViewController = navController
//        window.makeKeyAndVisible()
//    }
}


