//
//  CardView.swift
//  HackerUITaskSwift
//
//  Created by KamsQue on 28/03/2023.
//

import Foundation
import SwiftUI

protocol CommentsViewDelegate: AnyObject {
  func didTapCardView()
}

struct CardView: View {
  var totalCommentsView: TotalCommentsView
  var documentView: DocumentView
  var chatView: ChatView
  var downloadView: DownloadView
  var aiView: AIView
  
  
  var body: some View {
    VStack {
      VStack {
        HStack {
          documentView
          VStack(spacing: 8){
            chatView
            downloadView
          }
          aiView
        }
        .padding(.horizontal)
        Spacer()
      }
      .frame(width: UIScreen.main.bounds.width * 0.95, height: 190)
      .background(Color(hex: "F0F0F0"))
      .cornerRadius(10)
      .padding(.horizontal)
      totalCommentsView
      Spacer()
      Rectangle()
        .fill(Color.gray)
        .frame(width: UIScreen.main.bounds.width * 0.97,height: 1)
      Text("Comments")
        .frame(width: UIScreen.main.bounds.width * 0.95 , alignment: .leading)
    }
  }
}

protocol CardViewDelegate {
  func documentViewTapped()
  func chatViewTapped()
  func aiViewTapped()
}

