//
//  EditAudio.swift
//  HackerUITaskSwift
//
//  Created by KamsQue on 31/03/2023.
//

import SwiftUI

  // AudioEditor.swift

protocol AudioEditor {
  func editAudio(_ audioFile: AudioFile) -> AudioFile
}

//class NoiseRemover: AudioEditor {
////  func editAudio(_ audioFile: AudioFile) -> AudioFile {
////      // Implementation of noise removal algorithm
////      // ...
////    return editedAudioFile
////  }
//}

class AudioPlayer {
  func playAudio(_ audioFile: AudioFile) {
      // Implementation of audio playback
      // ...
  }
}

  // ContentView.swift

struct EditAudio: View {
  @StateObject private var audioFileLoader = AudioFileLoader()
  @State private var editedAudioFile: AudioFile?
  
//  private let noiseRemover = NoiseRemover()
  private let audioPlayer = AudioPlayer()
  
  var body: some View {
    VStack {
      if let audioFile = audioFileLoader.audioFile {
        Text("File Name: \(audioFile.name)")
        Button("Edit Audio") {
//          editedAudioFile = noiseRemover.editAudio(audioFile)
        }
        .disabled(editedAudioFile != nil)
        Button("Play Audio") {
          if let editedAudioFile = editedAudioFile {
            audioPlayer.playAudio(editedAudioFile)
          } else {
            audioPlayer.playAudio(audioFile)
          }
        }
      } else {
        Button("Select Audio File") {
//          audioFileLoader.loadAudioFile()
        }
      }
    }
  }
}

  // AudioFileLoader.swift

class AudioFileLoader: ObservableObject {
  @Published var audioFile: AudioFile?
  
//  func loadAudioFile() {
//      // Implementation of file selection and loading
//      // ...
//    audioFile = loadedAudioFile
//  }
}

  // AudioFile.swift

class AudioFile {
  let name: String
  let data: Data
  
  init(name: String, data: Data) {
    self.name = name
    self.data = data
  }
}

