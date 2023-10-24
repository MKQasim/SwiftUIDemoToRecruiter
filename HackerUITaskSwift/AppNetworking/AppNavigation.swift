//
//  AppNavigation.swift
//  HackerUITaskSwift
//
//  Created by KamsQue on 26/03/2023.
//

import Foundation

  // Navigation Protocols

protocol HomeViewNavigation {
  func navigateToComments()
  func navigateToProfile()
}

protocol CommentsViewNavigation {
  func navigateBack()
}

protocol ProfileViewNavigation{
  func navigateBack()
}
