//
//  CommentsViewModel.swift
//  HackerUITaskSwift
//
//  Created by KamsQue on 28/03/2023.
//

import Foundation

  // MARK: - HomeViewModel
class HomeViewModel: ObservableObject {
  private let pilot: UIPilot<AppRoute>
  
  init(pilot: UIPilot<AppRoute>) {
    self.pilot = pilot
  }
  
  func showProfileView() {
    pilot.push(.profileView)
  }
  
  func showCommentsView() {
    pilot.push(.commentsView)
  }
}
