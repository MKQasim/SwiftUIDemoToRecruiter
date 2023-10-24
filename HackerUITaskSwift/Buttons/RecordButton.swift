  //
  //  RecordButton.swift
  //  HackerUITaskSwift
  //
  //  Created by KamsQue on 23/03/2023.
  //

import SwiftUI
import MobileCoreServices

struct RecordButton: View {
  var body: some View {
    Button(action: {
      presentAudioPicker()
    }) {
      VStack {
        Text("Audios")
          .bold()
          .padding()
          .background(Color.init(uiColor: UIColor.init(red: 240/255, green: 240/255, blue: 240/255, alpha: 1)))
          .foregroundColor(Color.black)
          .cornerRadius(30)
          .frame(width: 100)
          .minimumScaleFactor(0.5)
          .shadow(color: Color(hex: "#979797")?.opacity(1.0) ?? Color.red, radius: 10)
        
      }
    }
  }
  
  func presentAudioPicker() {
    let types: [String] = [kUTTypeAudio as String]
    let picker = UIDocumentPickerViewController(documentTypes: types, in: .import)
    UIApplication.shared.windows.first?.rootViewController?.present(picker, animated: true)
  }
}


struct RecordButton_Previews: PreviewProvider {
  static var previews: some View {
    RecordButton()
  }
}


