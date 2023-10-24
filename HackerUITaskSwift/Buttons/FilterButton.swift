  //
  //  FilterButton.swift
  //  HackerUITaskSwift
  //
  //  Created by KamsQue on 23/03/2023.
  //

import SwiftUI

struct FilterButton: View {
  
  @State private var showMenu = false
  @State private var selectedOption: Option? = nil
  
  var body: some View {
    Menu {
      ForEach(Option.allCases, id: \.self) { option in
        Button(action: {
          selectedOption = option
          showMenu.toggle()
        }) {
          Label(option.title, systemImage: option.symbolName)
        }
      }
    } label: {
      HStack {
        Text(selectedOption?.title ?? "Filter by")
          .frame(width: 110, height: 55,alignment: .leading)
          .padding(.leading, 15)
          .bold()
          .foregroundColor(.black)
          .lineLimit(1)
          .minimumScaleFactor(0.5 + CGFloat(selectedOption?.title.count ?? 6) / 20.0)
        Image(systemName: "chevron.down")
          .padding(.leading, -35)
//          .offset(x: -10, y: 0)
          .foregroundColor(.black)
      }
      
      .background(Color.white)
      .cornerRadius(27.5)
     
      .shadow(color: Color(hex: "#979797")?.opacity(1.0) ?? Color.red, radius: 10)
    }
  }
}

struct FilterButton_Previews: PreviewProvider {
  static var previews: some View {
    FilterButton()
  }
}


