  //
  //  HomeView.swift
  //  HackerUITaskSwift
  //
  //  Created by KamsQue on 22/03/2023.
  //


import SwiftUI
import AVKit
import CoreImage
import CoreMedia
import UIKit

  // MARK: - HomeView
struct HomeView: View , HomeViewNavigation{
  @StateObject var viewModel: HomeViewModel
  @State var showPreview = false
    
  @State private var previewURL: URL?
  var body: some View {
    NavigationView {
      ZStack {
        LinearGradient(gradient: Gradient(colors: [Color.black,Color.init(uiColor:  UIColor(red: 45/255, green: 45/255, blue: 45/255, alpha: 1))]), startPoint: .top, endPoint: .bottom)
          .ignoresSafeArea()
        VStack {
          Spacer()
          Text("Welcome to the Home Screen!")
            .foregroundColor(.white)
            .font(.largeTitle)
          Spacer()
          Button(action: {
            viewModel.showProfileView()
          }) {
            Text("Open ProfileView View")
              .foregroundColor(.black)
              .padding()
              .background(Color.white)
              .cornerRadius(10)
          }
          Spacer()
          Button(action: {
            viewModel.showCommentsView()
          }) {
            Text("Open Comments View")
              .foregroundColor(.black)
              .padding()
              .background(Color.white)
              .cornerRadius(10)
          }
          Spacer()
        }
      }.sheet(isPresented: $showPreview) {
        NavigationView {
          if let preview = previewURL{
            DocumentPreviewView(previewItemURL: preview)
              //          PDFPreviewView(pdfURL: previewURL)
          }
        }
      }
      .background(LinearGradient(gradient: Gradient(colors:  [Color.blue, Color.orange]), startPoint: .top, endPoint: .bottom)).edgesIgnoringSafeArea(.all).frame(width: UIScreen.main.bounds.width,height: UIScreen.main.bounds.height)
      .navigationViewStyle(StackNavigationViewStyle())
      .environmentObject(viewModel)
      .navigationBarTitleDisplayMode(.inline)
      .navigationBarHidden(true)
      .navigationBarBackButtonHidden(false)
      .background(Color.clear)
      .navigationBarTitle("", displayMode: .inline)
    }
    .navigationBarHidden(true)
    .navigationViewStyle(StackNavigationViewStyle())
    .environmentObject(viewModel)
  }


  func navigateToComments() {
    viewModel.showCommentsView()
  }

  func navigateToProfile() {
    viewModel.showProfileView()
  }
  
}

struct AplayerView : View {
    
    let buttonTitles = ["Edit Audio", "Edit Vidio", "Remove Noise", "Remove clips", "Mute"]
    let buttonImages = ["speaker.fill", "music.note.list", "mic.fill", "record.circle.fill", "guitars"]
    @State private var angle: Double = 0.0
    @State private var playButtonPosition: CGPoint = CGPoint(x: 0, y: 0)
    @GestureState private var dragOffset: CGSize = CGSize.zero
    
    @State private var previewURL: URL?
    @State private var audioPlayer: AVPlayer?
    @State private var videoPlayer: AVPlayer?
    @State private var mixerPlayer: AVPlayer?
    @State private var isPlaying = false
    @State var audioFile: URL?
    @State var videoFile: URL?
    
    var body: some View {
                VStack {
                  VStack{
                    Spacer()
                    VStack{
                      ZStack(alignment: .center) {
                        ForEach(0..<self.buttonTitles.count) { index in
                          let buttonAngle = self.angle + Double(index) * (360.0 / Double(self.buttonTitles.count))
                          let buttonX = cos(buttonAngle * Double.pi / 180.0) * 120.0
                          let buttonY = sin(buttonAngle * Double.pi / 180.0) * 120.0
        
                          Button(action: {
        
                            if index == 0 {
                                // Edit audio button action
                              self.removeNoise()
                              self.playAudio()
                            } else if index == 1 {
                                // Edit video button action
                              self.playVideo()
                            } else if index == 2 {
                                // Remove noise button action
                              self.mixAudioAndVideo()
                            } else if index == 3 {
                                // Remove clips button action
                            } else if index == 4 {
                                // Mute button action
                            }
                              // button action
                          }) {
                            VStack {
                              Image(systemName: self.buttonImages[index])
                                .font(.largeTitle)
                                .foregroundColor(.white)
                                .shadow(radius: 10, x: 0, y: 5)
                              Text(self.buttonTitles[index])
                                .foregroundColor(.white)
                            }
                            .frame(width: 100, height: 100)
                            .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                            .background(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.orange]), startPoint: .leading, endPoint: .trailing))
                            .cornerRadius(50)
                          }
                          .offset(x: buttonX, y: buttonY)
                          .animation(.easeInOut)
                        }
        
                        Button(action: {
                          self.isPlaying.toggle()
                          if self.isPlaying {
                              // play action
                          } else {
                              // pause action
                          }
                        }, label: {
                          Image(systemName: isPlaying ? "pause.circle.fill" : "play.circle.fill")
                            .font(.system(size: 70))
                            .foregroundColor(.white)
                        })
                        .frame(width: 120, height: 120)
                        .background(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.orange]), startPoint: .leading, endPoint: .trailing))
                        .cornerRadius(60)
                        .offset(x:0,y:0)
                      }
                    }.frame(height: 400)
                    Spacer()
                  }
                  VStack{
                    Spacer()
                    HStack {
                      Spacer()
                      AudioVideoPickerButton { url in
                          // Handle the selected file URL here
                        previewURL = url
                          //                        let previewView = DocumentPreviewView(previewItemURL: url)
                          //                        let previewViewController = UIHostingController(rootView: previewView)
                          //            if let preview = url{
                          //
                          //                //
                          //            }
                        PDFPreviewView(pdfURL: url)
                          //            DocumentPreviewView(previewItemURL: url)
                          //            showPreview  = true
                        print(previewURL)
                      }
                      .padding(.trailing, 20)
                      .padding(.bottom, 44)
                    }.frame(height: 120).background(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.orange]), startPoint: .leading, endPoint: .trailing))
                  }
                }
              
    }
    
    private func removeNoise() {
      guard let url = Bundle.main.url(forResource: "audio", withExtension: "mp3") else {
        print("Error: Audio file not found")
        return
      }
      
      do {
        let audioFile = try AVAudioFile(forReading: url)
        let audioEngine = AVAudioEngine()
        let audioPlayerNode = AVAudioPlayerNode()
        audioEngine.attach(audioPlayerNode)
        
        let highPassFilter = AVAudioUnitEQ(numberOfBands: 1)
        let band = highPassFilter.bands[0]
        band.filterType = .highPass
        band.frequency = 100
        band.bypass = false
        band.gain = 0
        band.bandwidth = 0.5
        
        audioEngine.attach(highPassFilter)
        
        audioEngine.connect(audioPlayerNode, to: highPassFilter, format: nil)
        audioEngine.connect(highPassFilter, to: audioEngine.mainMixerNode, format: nil)
        
        audioPlayerNode.scheduleFile(audioFile, at: nil, completionHandler: nil)
        try audioEngine.start()
        audioPlayerNode.play()
        isPlaying = true
      } catch {
        print("Error: \(error.localizedDescription)")
      }
    }
    
    
    private func playAudio() {
      guard let url = Bundle.main.url(forResource: "audio", withExtension: "mp3") else {
        print("Error: Audio file not found")
        return
      }
      
      audioPlayer = AVPlayer(url: url)
      audioPlayer?.play()
      isPlaying = true
    }
    
    private func playVideo() {
      guard let videoURL = URL(string: "https://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_10mb.mp4") else {
        print("Error: Video file not found")
        return
      }
      
      videoPlayer = AVPlayer(url: videoURL)
      let playerViewController = AVPlayerViewController()
      playerViewController.player = videoPlayer
      UIApplication.shared.windows.first?.rootViewController?.present(playerViewController, animated: true) {
        playerViewController.player?.play()
        self.isPlaying = true
      }
    }
    
    private func mixAudioAndVideo() {
      guard let videoURL = Bundle.main.url(forResource: "video", withExtension: "mp4") else {
        print("Error: Video file not found")
        return
      }
      
      guard let audioURL = Bundle.main.url(forResource: "audio", withExtension: "mp3") else {
        print("Error: Audio file not found")
        return
      }
      
      let audioAsset = AVURLAsset(url: audioURL)
      let videoAsset = AVURLAsset(url: videoURL)
      
      let mixComposition = AVMutableComposition()
      
        //    let audioTrack = mixComposition.addMutableTrack(withMediaType: .audio, preferredTrackID: kCMPersistentTrackID_Invalid)
        //    try? audioTrack?.insertTimeRange(CMTimeRangeMake(start: CMTime.zero, duration:
    }
}

struct PDFPreviewView: View {
  var pdfURL: URL
  
  var body: some View {
    DocumentPreviewView(previewItemURL: pdfURL)
      .navigationBarTitle(Text("Preview"))
      .background(Color.white)
  }
}
struct HomeView_Previews: PreviewProvider {
  
  static let pilot = UIPilot(initial: AppRoute.home)
  
  static var previews: some View {
    HomeView(viewModel: HomeViewModel(pilot: pilot))
      .environmentObject(pilot)
  }
}



