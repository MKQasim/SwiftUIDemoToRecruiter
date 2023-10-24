  //
  //  ProfileListItemCell.swift
  //  HackerUITaskSwift
  //
  //  Created by KamsQue on 23/03/2023.
  //

import SwiftUI

struct ProfileListItemCell: View {
  let profileListItem: ProfileListItem
  @State private var showAlert = false
  
  var body: some View {
    
    ZStack {
      Rectangle()
        .fill(Color.white)
        .frame(maxWidth: UIScreen.main.bounds.width * 0.95, idealHeight: UIScreen.main.bounds.height * 0.3)
        .cornerRadius(20)
        .shadow(color: Color(hex: "#979797")?.opacity(25.0) ?? Color.red, radius: 5)
      
      VStack(spacing: 0) {
        Image(profileListItem.imageName)
          .resizable()
          .frame(maxWidth: UIScreen.main.bounds.width * 0.85, idealHeight: UIScreen.main.bounds.height * 0.14)
          .aspectRatio(contentMode: .fit)
          .cornerRadius(10)
          .shadow(radius: 5)
          .padding(.top,6)
        
        Text(profileListItem.title + "\(UIScreen.main.bounds.height * 0.37)")
          .frame(maxWidth: UIScreen.main.bounds.width * 0.85, idealHeight: 20 , alignment: .leading)
          .font(.system(size: 12))
          .foregroundColor(Color.black)
          .fontWeight(.semibold)
          .multilineTextAlignment(.leading)
          .padding(.top,10)
        
        Text(profileListItem.details)
          .frame(maxWidth: UIScreen.main.bounds.width * 0.85, idealHeight: 20 , alignment: .leading)
          .font(.system(size: 8))
          .foregroundColor(Color.gray)
          .fontWeight(.regular)
          .padding(.top, 5)
          .fixedSize(horizontal: false, vertical: true)
          .multilineTextAlignment(.leading)
        HStack {
          HStack(spacing: 5) {
            Text(profileListItem.name)
              .font(.subheadline)
              .foregroundColor(Color.black)
            Text(profileListItem.time)
              .font(.subheadline)
              .foregroundColor(Color.black)
          }
          Spacer()
          HStack(spacing: 8) {
            Image(profileListItem.likeImage)
              .resizable()
              .aspectRatio(contentMode: .fit)
              .frame(height: 22)
            Text(profileListItem.likeCount)
              .font(.subheadline)
              .foregroundColor(Color.black)
            Image(profileListItem.commentsImage)
              .resizable()
              .aspectRatio(contentMode: .fit)
              .frame(height: 22)
            Text(profileListItem.commentsCount)
              .font(.subheadline)
              .foregroundColor(Color.black)
          }
        }.padding(.top, 5).frame(maxWidth: UIScreen.main.bounds.width * 0.85, idealHeight: 50)
        Divider().background(Color.gray).padding(.top,10).frame(maxWidth: UIScreen.main.bounds.width * 0.85, idealHeight: 1)
        HStack(spacing: 8) {
          HStack{
            Button(action: {
                // add the action you want the button to perform here
              showAlert = true
              print("Edit clicked")
            }) {
              Image(profileListItem.chatbotImage)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 22)
            }
            .alert(isPresented: $showAlert) {
              Alert(title: Text("Image chat bot Image Button Clicked"), message: Text("You clicked the chat bot Image button."), dismissButton: .default(Text("OK")))
            }
            Text(profileListItem.chatwithDoc)
              .font(.subheadline)
              .foregroundColor(Color.black)
          }
          Spacer()
          HStack{
            Button(action: {
                // add the action you want the button to perform here
              showAlert = true
              print("Edit clicked")
            }) {
              Image(profileListItem.downloadImage)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 22)
            }
            .alert(isPresented: $showAlert) {
              Alert(title: Text("download Image Button Clicked"), message: Text("You clicked the download Image button."), dismissButton: .default(Text("OK")))
            }
            
            Text(profileListItem.downloadFile)
              .font(.subheadline)
              .foregroundColor(Color.black)
          }
        }.padding(.top, 10).frame(maxWidth: UIScreen.main.bounds.width * 0.85, idealHeight: 50)
      }.frame(maxWidth: UIScreen.main.bounds.width * 0.95, idealHeight: UIScreen.main.bounds.height * 0.3)
        .padding(.zero)
      
    }.frame(maxWidth: UIScreen.main.bounds.width * 0.95, idealHeight: UIScreen.main.bounds.height * 0.3)
  }
}

struct ProfileListItemCell_Previews: PreviewProvider {
  static var previews: some View {
    ProfileListItemCell(profileListItem: ProfileListItem(imageName: "postImage", title: "Lorem Ipsum is simply dummy", details: "Lorem Ipsum is simply dummy text of the printing and typesetting industry....", name: "Ahsen S.",  time: "| 5 minutes ago", likeImage: "like", likeCount: "23 K", commentsImage: "comments", commentsCount: "3.3 K", chatbotImage: "chatbot", chatwithDoc: "Chat with Document", downloadImage: "download", downloadFile: "Download File"))
  }
}
