//
//  AudioVideoPickerButton.swift
//  HackerUITaskSwift
//
//  Created by KamsQue on 31/03/2023.
//

import SwiftUI
import MobileCoreServices
import UIKit


struct DocumentPicker: UIViewControllerRepresentable {
  var onFileSelected: ((URL) -> Void)?
  
  func makeCoordinator() -> DocumentPicker.Coordinator {
    return DocumentPicker.Coordinator(parent1: self)
  }
  
  func makeUIViewController(context: UIViewControllerRepresentableContext<DocumentPicker>) -> UIDocumentPickerViewController {
    let picker = UIDocumentPickerViewController(forOpeningContentTypes: [.video,.audio,.pdf,.png,.jpeg])
    picker.allowsMultipleSelection = false
    picker.delegate = context.coordinator
    return picker
  }
  
  func updateUIViewController(_ uiViewController: UIDocumentPickerViewController, context: UIViewControllerRepresentableContext<DocumentPicker>) {
  }
  
  class Coordinator: NSObject, UIDocumentPickerDelegate {
    var parent: DocumentPicker
    
    init(parent1: DocumentPicker){
      parent = parent1
    }
    
    func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
      if let url = urls.first {
        parent.onFileSelected?(url)
      }
    }
  }
}


struct AudioVideoPickerButton: View {
  @State var selectedDocument: URL?
  var onFileSelected: ((URL) -> Void)?
  
  var body: some View {
    Button(action: {
      let picker = DocumentPicker(onFileSelected: onFileSelected)
      let hostingController = UIHostingController(rootView: picker)
      UIApplication.shared.windows.first?.rootViewController?.present(hostingController, animated: true, completion: nil)
    }) {
      VStack {
        Image(systemName: "doc.text.magnifyingglass")
          .font(.body)
          .foregroundColor(.white)
          .shadow(radius: 10, x: 0, y: 5)
        Text("Select Document")
          .foregroundColor(.white)
          .font(.system(size: 8))
          .shadow(color: Color(hex: "#979797")?.opacity(1.0) ?? Color.red, radius: 10)
      }
      .frame(width: 60, height: 60)
      .background(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple]), startPoint: .leading, endPoint: .trailing))
      .cornerRadius(30)
    }
  }
}



struct AudioVideoPickerButton_Previews: PreviewProvider {
  static var previews: some View {
    AudioVideoPickerButton()
  }
}


import SwiftUI
import QuickLook

struct DocumentPreviewView: UIViewControllerRepresentable {
  var previewItemURL: URL
  
  func makeUIViewController(context: UIViewControllerRepresentableContext<DocumentPreviewView>) -> QLPreviewController {
    let controller = QLPreviewController()
    do {
      controller.dataSource = context.coordinator
      controller.modalPresentationStyle = .overFullScreen
      controller.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: context.coordinator, action: #selector(Coordinator.share(_:)))
      controller.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: context.coordinator, action: #selector(Coordinator.done(_:)))
    } catch {
      print("Error loading preview controller: \(error.localizedDescription)")
    }
    return controller
  }
  
  func updateUIViewController(_ uiViewController: QLPreviewController, context: UIViewControllerRepresentableContext<DocumentPreviewView>) {
  }
  
  func makeCoordinator() -> Coordinator {
    return Coordinator(self)
  }
  
  class Coordinator: NSObject, QLPreviewControllerDataSource, QLPreviewControllerDelegate {
    var parent: DocumentPreviewView
    
    init(_ parent: DocumentPreviewView) {
      self.parent = parent
    }
    
    func numberOfPreviewItems(in controller: QLPreviewController) -> Int {
      return 1
    }
    
    func previewController(_ controller: QLPreviewController, previewItemAt index: Int) -> QLPreviewItem {
      return parent.previewItemURL as QLPreviewItem
    }
    
    func previewController(_ controller: QLPreviewController, didUpdateContentsOf previewItem: QLPreviewItem) {
      controller.reloadData()
    }
    
    @objc func done(_ sender: Any) {
      UIApplication.shared.windows.first?.rootViewController?.dismiss(animated: true, completion: nil)
    }
    
    @objc func share(_ sender: Any) {
      let activityViewController = UIActivityViewController(activityItems: [parent.previewItemURL], applicationActivities: nil)
      UIApplication.shared.windows.first?.rootViewController?.present(activityViewController, animated: true, completion: nil)
    }
  }

}
