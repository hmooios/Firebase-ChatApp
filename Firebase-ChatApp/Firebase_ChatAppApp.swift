//
//  Firebase_ChatAppApp.swift
//  Firebase-ChatApp
//
//  Created by Hmoo Myat Theingi on 27/12/2023.
//

import SwiftUI
import FirebaseCore

@main
struct Firebase_ChatAppApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
    return true
  }
}
