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

struct HomeView_Previews: PreviewProvider {
  
  static let pilot = UIPilot(initial: AppRoute.home)
  
  static var previews: some View {
    HomeView(viewModel: HomeViewModel(pilot: pilot))
      .environmentObject(pilot)
  }
}



