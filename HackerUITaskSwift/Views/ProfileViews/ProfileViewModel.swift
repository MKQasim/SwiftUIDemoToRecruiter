//
//  ProfileViewModel.swift
//  HackerUITaskSwift
//
//  Created by KamsQue on 28/03/2023.
//

import Foundation
import SwiftUI

  // MARK: - ProfileViewModel
class ProfileViewModel: ObservableObject {
  var navigation: ProfileViewNavigation?
  
  func backButtonTapped() {
    navigation?.navigateBack()
  }
}
