//
//  DownloadDoc.swift
//  HackerUITaskSwift
//
//  Created by KamsQue on 28/03/2023.
//

import Foundation
import SwiftUI

struct DownloadView: View {
  var downloadImage: Image
  var downloadText: String
  
  var body: some View {
    HStack {
      downloadImage
        .foregroundColor(.black)
      
      Text(downloadText)
        .font(.custom("Helvetica", size: 12))
        .bold()
        .foregroundColor(.black)
      
      Spacer()
    }
  }
}
