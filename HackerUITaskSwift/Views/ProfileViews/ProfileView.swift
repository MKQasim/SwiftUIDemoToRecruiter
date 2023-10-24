  //
  //  ScrollSection.swift
  //  HackerUITaskSwift
  //
  //  Created by KamsQue on 22/03/2023.
  //

import SwiftUI



  // MARK: - HomeView

struct ProfileView: View , ProfileViewNavigation {
  
  @EnvironmentObject var pilot: UIPilot<AppRoute>
  @StateObject private var viewModel = ProfileViewModel()
  @State var title = "Profile"
  @State var name: String = "John Doe"
  @State var details: String = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla tincidunt blandit enim, quis blandit nunc tristique vel."
  
  var body: some View {
    VStack {
      CurvedGradientNavigationView(title: "Profile",
                                   backgroundStyle: .gradient(Gradient(colors: [.black])),
                                   leftItems: [
                                    LeftNavigationItem(.backButton {
                                        // Handle back button action here
                                      dismissCommentsView()
                                    }),
                                  
                                   ],rightItems: [
                                   ])
      {
      }
      .environmentObject(viewModel)
      .navigationBarHidden(true)
      VStack(spacing: 0) {
        ProfilePictureView()
      }
      .padding(.vertical, 0)
      ProfileCenterView().padding(.all)
      ProfileListView()
    }
      .onAppear {
        
        viewModel.navigation = self
      }
      .onDisappear {
    
      }.preferredColorScheme(.dark)
  }
  
  func dismissCommentsView() {
    pilot.pop()
    print("dismissCommentsView")
  }
  
  func navigateBack() {
    viewModel.backButtonTapped()
  }
}


struct ProfileView_Previews: PreviewProvider {
  static var previews: some View {
    ProfileView()
  }
}
