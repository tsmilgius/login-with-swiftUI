//
//  LoginDemoApp.swift
//  LoginDemo
//
//  Created by Tomas Smilgius on 11/12/2023.
//

import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
    return true
  }
}

@main
struct LoginDemoApp: App {
    // register app delegate for Firebase setup
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject var viewModel = AuthViewModel()
    
  var body: some Scene {
    WindowGroup {
      NavigationView {
       ContentView()
              .environmentObject(viewModel)
      }
    }
  }
}
