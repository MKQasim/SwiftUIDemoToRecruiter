  //
  //  ProfileListData.swift
  //  HackerUITaskSwift
  //
  //  Created by KamsQue on 23/03/2023.
  //

import Swift
import UIKit

let profileListData: [ProfileListItem] = [
  ProfileListItem(imageName: "postImage", title: "Lorem Ipsum is simply dummy", details: "Lorem Ipsum is simply dummy text of the printing and typesetting industry....", name: "Ahsen S.",  time: "| 5 minutes ago", likeImage: "like", likeCount: "23 K", commentsImage: "comments", commentsCount: "3.3 K", chatbotImage: "chatbot", chatwithDoc: "Chat with Document", downloadImage: "download", downloadFile: "Download File"),
  
  ProfileListItem(imageName: "postImage", title: "Lorem Ipsum is simply dummy", details: "Lorem Ipsum is simply dummy text of the printing and typesetting industry....", name: "Ahsen S.",  time: "| 5 minutes ago", likeImage: "like", likeCount: "23 K", commentsImage: "comment", commentsCount: "3.3 K", chatbotImage: "chatbot", chatwithDoc: "Chat with Document", downloadImage: "download", downloadFile: "Download File"),
  
  ProfileListItem(imageName: "postImage", title: "Lorem Ipsum is simply dummy", details: "Lorem Ipsum is simply dummy text of the printing and typesetting industry....", name: "Ahsen S.", time: "| 5 minutes ago", likeImage: "like", likeCount: "23 K", commentsImage: "comment", commentsCount: "3.3 K", chatbotImage: "chatbot", chatwithDoc: "Chat with Document", downloadImage: "download", downloadFile: "Download File"),
]

enum Attachment {
  case document, audio
  
  var title: String {
    switch self {
    case .document:
      return "Document"
    case .audio:
      return "Record or Upload Voice"
    }
  }
  
  func open() {
    switch self {
    case .document:
      let documentPicker = UIDocumentPickerViewController(documentTypes: ["public.item"], in: .import)
      UIApplication.shared.windows.first?.rootViewController?.present(documentPicker, animated: true, completion: nil)
    case .audio:
        // handle audio attachment
      break
    }
  }
}

enum Option: String, CaseIterable {
  case option1, option2, option3
  
  var title: String {
    switch self {
    case .option1:
      return "Option 1"
    case .option2:
      return "Option 2"
    case .option3:
      return "Option 3"
    }
  }
  
  var symbolName: String {
    switch self {
    case .option1:
      return "circle"
    case .option2:
      return "square"
    case .option3:
      return "triangle"
    }
  }
}
