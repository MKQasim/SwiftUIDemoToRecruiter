//
//  CommentsViewModel.swift
//  HackerUITaskSwift
//
//  Created by KamsQue on 28/03/2023.
//

import Foundation

  // Create a protocol for the navigation actions
protocol CommentsViewNavigationDelegate: AnyObject {
  func dismissCommentsView()
  func showProfileView()
}
  // MARK: - CommentsViewModel
class CommentsViewModel: ObservableObject {
  @Published var comments: [CommentsModel] = []
  var navigation: CommentsViewNavigation?
  private let pilot: UIPilot<AppRoute>
  
  init(pilot: UIPilot<AppRoute>) {
    self.pilot = pilot
    fetchComments()
  }
  
  internal func fetchComments() {
    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
      self.comments = CommentsModel.dummyData
    }
  }
  
  func backButtonTapped() {
    navigation?.navigateBack()
  }
  func didTapCardView() {
      // handle card view tap action here
  }
  
  func reset() {
    let newViewModel = CommentsViewModel(pilot: self.pilot)
    self.comments = newViewModel.comments
    self.navigation = newViewModel.navigation
  }
}
