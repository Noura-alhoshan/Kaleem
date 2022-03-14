////
////  VolunteerHome.swift
////  Kaleem
////
////  Created by Sarah S on 24/06/1443 AH.
////
//
//import SwiftUI
//import FirebaseAuth
//import Firebase
//
//struct VolunteerHome: View {
//    @EnvironmentObject var session: SessionStore
//
//
//    var body: some View {
//
//        VStack{
//            Text("Hello Volunteer!")
//
//        Button(action: {
//            session.signOut()
//        }, label: {
//            Text("تسجيل الخروج")
//                .font(.headline)
//                .foregroundColor(.white)
//                .padding()
//                .frame(width: 220, height: 60)
//                .background(Color.black)
//                .cornerRadius(35.0)
//        })
//        } //Text("looooong time").bold()
//    }
//}
//
//struct Home_Previews: PreviewProvider {
//    static var previews: some View {
//        VolunteerHome()
//    }
//}
//
//  VolunteerHome.swift
//  Kaleem
//
//  Created by Sarah S on 24/06/1443 AH.
//

import SwiftUI
import FirebaseAuth
import Firebase
import UserNotifications
import FirebaseMessaging

struct VolunteerHome: View {
//    FOR Notification
//    @UIApplicationDelegateAdaptor(AppDelegate.self)
//      var appDelegate
    @EnvironmentObject var session: SessionStore
    init(){
        addTokenToDB()
}
    func addTokenToDB(){
    let db = Firestore.firestore()
    let token = Messaging.messaging().fcmToken
    guard let uid = Auth.auth().currentUser?.uid else {
            print ("ERROR IN v_Home when get current user ID")
            return }
        print(uid)
        if token != nil {
            print ("VOLUNTEER TOKEN IS: \(token)")
            db.collection("Volunteer").document(uid).collection("Tokens").document(token!).setData(["token":token,
                                                                                                   "createdAt":FieldValue.serverTimestamp(),
             ])
        }
}
    var body: some View {
        VStack{
            Text("Hello Volunteer!")

        Button(action: {
            session.signOut()
            
        }, label: {
            Text("تسجيل الخروج")
                .font(.headline)
                .foregroundColor(.white)
                .padding()
                .frame(width: 220, height: 60)
                .background(Color.black)
                .cornerRadius(35.0)
        })
        } //Text("looooong time").bold()
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        VolunteerHome()
    }
}
//class AppDelegate: NSObject, UIApplicationDelegate {
//   let gcmMessageIDKey = "gcm.message_id"
//
//    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
//       FirebaseApp.configure()
//
//
//        Messaging.messaging().delegate = self
//
//
//        if #available(iOS 10.0, *) {
//          // For iOS 10 display notification (sent via APNS)
//          UNUserNotificationCenter.current().delegate = self
//
//          let authOptions: UNAuthorizationOptions = [.alert, .badge, .sound]
//          UNUserNotificationCenter.current().requestAuthorization(
//            options: authOptions,
//            completionHandler: {_, _ in })
//        } else {
//          let settings: UIUserNotificationSettings =
//          UIUserNotificationSettings(types: [.alert, .badge, .sound], categories: nil)
//          application.registerUserNotificationSettings(settings)
//        }
//
//        application.registerForRemoteNotifications()
//        return true
//    }
//
//    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable: Any],
//                     fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
//
//      if let messageID = userInfo[gcmMessageIDKey] {
//        print("Message ID: \(messageID)")
//      }
//
//      print(userInfo)
//
//      completionHandler(UIBackgroundFetchResult.newData)
//    }
//}
//
//
//extension AppDelegate: MessagingDelegate {
//    func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String?) {
//      let deviceToken:[String: String] = ["token": fcmToken ?? ""]
//        print("Device token: ", deviceToken) // This token can be used for testing notifications on FCM
//    }
//}
//
//
//@available(iOS 10, *)
//extension AppDelegate : UNUserNotificationCenterDelegate {
//
//  // Receive displayed notifications for iOS 10 devices.
//  func userNotificationCenter(_ center: UNUserNotificationCenter,
//                              willPresent notification: UNNotification,
//    withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
//    let userInfo = notification.request.content.userInfo
//
//    if let messageID = userInfo[gcmMessageIDKey] {
//        print("Message ID: \(messageID)")
//    }
//
//    print(userInfo)
//
//    // Change this to your preferred presentation option
//    completionHandler([[.banner, .badge, .sound]])
//  }
//
//    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
//
//    }
//
//    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
//
//    }
//
//  func userNotificationCenter(_ center: UNUserNotificationCenter,
//                              didReceive response: UNNotificationResponse,
//                              withCompletionHandler completionHandler: @escaping () -> Void) {
//    let userInfo = response.notification.request.content.userInfo
//
//    if let messageID = userInfo[gcmMessageIDKey] {
//      print("Message ID from userNotificationCenter didReceive: \(messageID)")
//    }
//
//    print(userInfo)
//
//    completionHandler()
//  }
//}
//

