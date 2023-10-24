//
//  CommentsListIem.swift
//  HackerUITaskSwift
//
//  Created by KamsQue on 28/03/2023.
//

import Foundation
import SwiftUI

struct ListItem: View {
  let comment: CommentsModel
  
  var body: some View {
    HStack(alignment: .top){
      ProfileImageView(image: comment.profileImage, name: comment.name)
      VStack(alignment: .leading , spacing: 15){
        ProfileNameView(name: comment.name)
        ProfileTagView(tagName: comment.tagName)
        ProfileDescriptionView(description: comment.description)
        ProfileStatisticsView(likes: comment.likes, comments: comment.comments)
      }
    }
    .frame(maxWidth: .infinity, alignment: .leading)
    .padding(.vertical, 10)
    .overlay(Rectangle().fill(Color.gray).frame(height: 1), alignment: .bottom)
  }
}

struct ProfileImageView: View {
  let image: Image
  let name : String
  var body: some View {
    ZStack {
      image
        .resizable()
        .scaledToFit()
        .frame(width: 80, height: 80)
        .clipShape(Circle())
      HStack(spacing:0){
        ForEach(name.split(separator: " ").map { String($0.first!) }, id: \.self) { letter in
          Text(letter)
            .font(.title)
            .bold()
            .foregroundColor(.black)
        }
      }
    }
  }
}

struct ProfileNameView: View {
  let name: String
  
  var body: some View {
    Text(name)
      .font(.system(size: 12, weight: .bold))
      .foregroundColor(.gray)
      .frame(maxWidth: .infinity, alignment: .leading)
  }
}

struct ProfileTagView: View {
  let tagName: String
  
  var body: some View {
    Text(tagName)
      .font(.system(size: 12, weight: .bold))
      .foregroundColor(.gray)
      .frame(maxWidth: .infinity, alignment: .leading)
  }
}

struct ProfileDescriptionView: View {
  let description: String
  
  var body: some View {
    Text(description)
      .font(.system(size: 12, weight: .regular))
      .foregroundColor(.gray)
      .frame(maxWidth: .infinity, alignment: .leading)
  }
}

struct ProfileStatisticsView: View {
  let likes: Double
  let comments: Double
  
  var body: some View {
    HStack(spacing: 10) {
      HStack {
        Image("like")
        Text("\(likes, specifier: "%.2f")")
      }
      HStack {
        Image("comments")
        Text("\(comments, specifier: "%.2f")")
      }
    }
    .frame(maxWidth: .infinity, alignment: .leading)
  }
}
