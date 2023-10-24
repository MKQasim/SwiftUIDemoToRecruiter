  //
  //  CommentsView.swift
  //  HackerUITaskSwift
  //
  //  Created by KamsQue on 23/03/2023.
  //

import SwiftUI
import Combine


  
  // MARK: - CommentsView
struct CommentsView: View, CommentsViewNavigation {
  @ObservedObject var viewModel: CommentsViewModel
  @EnvironmentObject var pilot: UIPilot<AppRoute>
  @State private var showProfile = false
  
  var body: some View {
    VStack {
      CurvedGradientNavigationView(title: "",
                                   backgroundStyle: .gradient(Gradient(colors: [.black, .init(uiColor: UIColor(red: 45/255, green: 45/255, blue: 45/255, alpha: 0.75))])),
                                   leftItems: [
                                    LeftNavigationItem(.backButton {
                                      viewModel.backButtonTapped()
                                    }),
                                    LeftNavigationItem(.profileButton {
                                      pilot.push(.profileView)
                                    }),
                                    LeftNavigationItem(.doubleTitleText(title: "Ann Korkowski", subTitle: "@anniekork")),
                                   ],
                                   rightItems: [
                                    
                                    RightNavigationItem(.moreButton {
                                        // Handle more button action here
                                    })
                                   ]) {}
                                   .environmentObject(viewModel)
                                   .navigationBarHidden(true)
      List {
        Section(header:  CardView(totalCommentsView: TotalCommentsView(
          comments: $viewModel.comments
        ),
          documentView: DocumentView(
            documentImage: Image("excell"),
            documentText: "View Doc"
          ),
          chatView: ChatView(
            chatImage: Image("typing"),
            chatText: "Chat with Document"
          ),
          downloadView: DownloadView(
            downloadImage: Image("commentDownload"),
            downloadText: "Download File"
          ),
          aiView: AIView(
            aiImage: Image("aiChat"),
            aiText: "AI Chat"
          )
       
        )) {
          ForEach(viewModel.comments, id: \.id) { comment in
            ListItem(comment: comment).listRowSeparator(.hidden)
              .frame(width: UIScreen.main.bounds.width * 0.95 , alignment: .leading)
          }
        }
        .headerProminence(.increased) // optional: increases the size of the section header
        Section {
         
        }
      }.listStyle(.plain)
      .frame(width: UIScreen.main.bounds.width * 0.95)
      
      Spacer()
    }
    .sheet(isPresented: $showProfile) {
      ProfileView()
    }
    .environmentObject(viewModel)
    .onAppear {
      
      viewModel.navigation = self
      viewModel.fetchComments()
    }
    .onDisappear {
      viewModel.reset()
    }.preferredColorScheme(.dark)
  }
  
  func navigateBack() {
    pilot.pop()
  }
}





