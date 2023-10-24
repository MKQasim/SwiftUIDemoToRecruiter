//
//  AIView.swift
//  HackerUITaskSwift
//
//  Created by KamsQue on 28/03/2023.
//

import Foundation
import SwiftUI

struct AIView: View {
  var aiImage: Image
  var aiText: String
  
  var body: some View {
    VStack {
      Spacer()
      aiImage
      Text(aiText)
        .font(.custom("Helvetica", size: 12))
        .foregroundColor(.black)
      Spacer()
    }
  }
}
