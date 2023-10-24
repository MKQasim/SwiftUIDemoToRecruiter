  //
  //  HackerUITaskSwiftApp.swift
  //  HackerUITaskSwift
  //
  //  Created by KamsQue on 22/03/2023.
  //

import SwiftUI
import Combine

  // MARK: - AppRoute
enum AppRoute: Equatable {
  case home
  case profileView
  case commentsView
  case browser(_ url: String)
}

  // MARK: - App
@main
struct ComplexSplitScreen: App {
  @StateObject var pilot = UIPilot(initial: AppRoute.home)
  
  var body: some Scene {
    WindowGroup {
      UIPilotHost(pilot) { route in
        switch route {
        case .home:
          HomeView(viewModel: HomeViewModel(pilot: pilot))
            .environmentObject(pilot) // Provide the UIPilot environment object to the HomeView
        case .profileView:
          ProfileView()
        case .commentsView:
          CommentsView(viewModel: CommentsViewModel(pilot: pilot))
        case .browser(let url):
          WebView(url: URL(string: url)!)
        }
      }
    }
  }
}



