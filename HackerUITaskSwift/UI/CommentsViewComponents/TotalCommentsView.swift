//
//  TotalCommentsView.swift
//  HackerUITaskSwift
//
//  Created by KamsQue on 28/03/2023.
//

import Foundation
import SwiftUI

struct TotalCommentsView: View {
  
  @Binding var comments: [CommentsModel]
  
  var likesCount: Double {
    comments.reduce(0) { $0 + $1.likes }
    
  }
  
  var commentsCount: Double {
    comments.reduce(0) { $0 + $1.comments }
  }
  
  var body: some View {
    
    HStack(spacing: 12 ) {
      Image("like")
        .resizable()
        .aspectRatio(contentMode: .fit)
        .frame(height: 22)
      Text("\(likesCount, specifier: "%.2f")")
        .font(.subheadline)
      Image("comments")
        .resizable()
        .aspectRatio(contentMode: .fit)
        .frame(height: 22)
      Text("\(commentsCount, specifier: "%.2f")")
        .font(.subheadline)
      Spacer()
    }.padding(16)
  }
}
