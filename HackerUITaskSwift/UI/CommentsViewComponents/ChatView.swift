//
//  ChatView.swift
//  HackerUITaskSwift
//
//  Created by KamsQue on 28/03/2023.
//

import Foundation
import SwiftUI

struct ChatView: View {
  var chatImage: Image
  var chatText: String
  
  var body: some View {
    HStack {
      chatImage
        .foregroundColor(.black)
      
      Text(chatText)
        .bold()
        .font(.custom("Helvetica", size: 12))
        .foregroundColor(.black)
      
      Spacer()
    }
  }
}
