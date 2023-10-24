  //
  //  ProfileCenterView.swift
  //  HackerUITaskSwift
  //
  //  Created by KamsQue on 23/03/2023.
  //

import SwiftUI
import UIKit
import AVFoundation

struct ProfileCenterView: View {
  
  @State private var showMenu = false
  @State private var selectedOption: Option? = nil
  @State private var selectedAttachment: Attachment? = nil
  
  var body: some View {
    HStack(spacing: 5) {
      DocumentsButton()
      RecordButton()
      FilterButton()
    }
    .padding(.horizontal, 20)
    .navigationBarHidden(true)
  }
}

struct ProfileCenterView_Previews: PreviewProvider {
  static var previews: some View {
    ProfileCenterView()
  }
}
