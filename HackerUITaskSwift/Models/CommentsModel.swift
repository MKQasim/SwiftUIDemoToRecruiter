//
//  CommentsModel.swift
//  HackerUITaskSwift
//
//  Created by KamsQue on 28/03/2023.
//

import Foundation
import SwiftUI

  // MARK: - CommentsModel
struct CommentsModel: Identifiable {
  let id = UUID()
  let profileImage: Image
  let name: String
  let tagName: String
  let description: String
  let likes: Double
  let comments: Double
  
  static let dummyData = [
    CommentsModel(profileImage: Image("navprofile"), name: "Marvin McKinney", tagName: "@McKinney", description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry....", likes: 230, comments: 330),
    CommentsModel(profileImage: Image("navprofile"), name: "John Doe", tagName: "@Doe", description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry....", likes: 140, comments: 100),
    CommentsModel(profileImage: Image("navprofile"), name: "Jane Smith", tagName: "@Smith", description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry....", likes: 80, comments: 100),
    CommentsModel(profileImage: Image("navprofile"), name: "Bob Johnson", tagName: "@Johnson", description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry....", likes: 200, comments: 440)
  ]
  
  struct TotalCommentsModel {
    var totalLikes: Int
    var totalComments: Int
  }
  
  
  let totalComments = TotalCommentsModel(totalLikes: 500, totalComments: 100)
  
}
