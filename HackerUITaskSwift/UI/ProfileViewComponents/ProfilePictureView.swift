  //
  //  ProfilePictureView.swift
  //  HackerUITaskSwift
  //
  //  Created by KamsQue on 22/03/2023.
  //

import SwiftUI

struct ProfilePictureView: View {
  @State private var isEditing: Bool = false
  @State private var profileImage: Image = Image("profileIcon")
  @State private var profileEditIcon: Image = Image("profileEditIcon")
  @State private var name: String = "John Doe"
  @State private var description: String = "This is a multiline text description.\nIt can contain multiple lines.\n contain multiple lines."
  @State private var showAlert = false
  let curveHeight: CGFloat = 260
  let colors = Gradient(colors: [.black, .init(uiColor: UIColor(red: 45/255, green: 45/255, blue: 45/255, alpha: 1))])
  let startPoint = UnitPoint(x: 0.5, y: 0)
  let endPoint = UnitPoint(x: 0.5, y: 1)
  
  var body: some View {
    ZStack {
      CurvedShapeView(curveHeight: curveHeight)
        .fill(LinearGradient(gradient: colors, startPoint: startPoint, endPoint: endPoint))
        .frame(width: UIScreen.main.bounds.width, height: curveHeight)
      VStack {
        ZStack {
          profileImage
            .resizable()
            .scaledToFit()
            .frame(width: 150, height: 150)
            .clipShape(Circle())
          Button(action: {
              // add the action you want the button to perform here
            showAlert = true
            print("Edit clicked")
          }) {
            profileEditIcon
              .resizable()
              .scaledToFit()
              .frame(width: 50, height: 50)
              .clipShape(Circle())
              .padding(50)
              .background(Color.clear)
              .offset(x: 50, y: 50)
          }
          .alert(isPresented: $showAlert) {
            Alert(title: Text("Image Profile Button Clicked"), message: Text("You clicked the image profile button."), dismissButton: .default(Text("OK")))
          }
            // add some padding to move the button up a bit
          HStack(spacing:0){
            ForEach(name.split(separator: " ").map { String($0.first!) }, id: \.self) { letter in
              Text(letter)
                .font(.title)
                .bold()
                .foregroundColor(.black)
            }
          }
          
          if isEditing {
            Button(action: {
                // handle edit button action
            }) {
              
            }
            .padding(.bottom, isEditing ? 0 : 0)
          }
        }
        
        Text(name)
          .font(.title)
          .bold()
          .foregroundColor(.white)
          .padding(.bottom, isEditing ? 0 : 0)
        
        Text(description)
          .font(.body)
          .multilineTextAlignment(.center)
          .foregroundColor(.white)
          .padding(.horizontal, isEditing ? 0 : 5)
        
      }
      .onTapGesture {
        isEditing.toggle()
      }
    }
    .navigationBarHidden(true)
  }
 
}


struct ProfilePictureView_Previews: PreviewProvider {
  static var previews: some View {
    ProfilePictureView()
  }
}
