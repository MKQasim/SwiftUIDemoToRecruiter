//
//  DocumentView.swift
//  HackerUITaskSwift
//
//  Created by KamsQue on 28/03/2023.
//

import Foundation
import SwiftUI

struct DocumentView: View {
  var documentImage: Image
  var documentText: String
  
  var body: some View {
    VStack {
      documentImage
        .resizable()
        .aspectRatio(contentMode: .fill)
        .frame(width: 96, height: 90)
        .padding(.trailing, 8)
        .padding(.top, 22)
      
      Text(documentText)
        .frame(width: 90, alignment: .center)
        .font(.custom("Helvetica", size: 12))
        .bold()
        .foregroundColor(.black)
        .underline(true, color: .black)
        .padding(.leading, 10)
    }
  }
}
