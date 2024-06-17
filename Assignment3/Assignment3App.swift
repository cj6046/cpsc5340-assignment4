//
// Assignment3App.swift : Assignment3
//
// Copyright © 2023 Auburn University.
// All Rights Reserved.


import SwiftUI
import FirebaseCore
import FirebaseAuth

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
      
      var actionCodeSettings = ActionCodeSettings()
      actionCodeSettings.url = URL(string: "https://example.appspot.com")
      actionCodeSettings.handleCodeInApp = true
      actionCodeSettings.setAndroidPackageName("com.firebase.example", installIfNotAvailable: false, minimumVersion: "12")

      let provider = FUIEmailAuth(authUI: FUIAuth.defaultAuthUI()!,
                                  signInMethod: FIREmailLinkAuthSignInMethod,
                                  forceSameDevice: false,
                                  allowNewEmailAccounts: true,
                                  actionCodeSetting: actionCodeSettings)

    return true
  }
}

@main
struct Assignment3App: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            Artworks()
        }
    }
}
