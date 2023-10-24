  //
  //  DocumentsButton.swift
  //  HackerUITaskSwift
  //
  //  Created by KamsQue on 23/03/2023.
  //

import SwiftUI
import MobileCoreServices

struct DocumentsButton: View {
  var body: some View {
    Button(action: {
      let picker = UIDocumentPickerViewController(documentTypes: ["public.content"], in: .import)
      picker.allowsMultipleSelection = false
      UIApplication.shared.windows.first?.rootViewController?.present(picker, animated: true)
    }) {
      Text("Documents")
        .padding()
        .bold()
        .background(Color.black)
        .foregroundColor(Color.white)
        .cornerRadius(30)
        .frame(width: 130) // Set the width to 150 points
        .shadow(color: Color(hex: "#979797")?.opacity(1.0) ?? Color.red, radius: 10)
    }
  }
  
  func presentAudioPicker() {
    let types: [String] = [kUTTypeAudio as String, kUTTypeVideo as String]
    let picker = UIDocumentPickerViewController(documentTypes: types, in: .import)
    UIApplication.shared.windows.first?.rootViewController?.present(picker, animated: true)
  }
}

struct DocumentsButton_Previews: PreviewProvider {
  static var previews: some View {
    DocumentsButton()
  }
}

