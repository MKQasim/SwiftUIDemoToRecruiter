  //
  //  ProfileListView.swift
  //  HackerUITaskSwift
  //
  //  Created by KamsQue on 23/03/2023.
  //

import SwiftUI

struct ProfileListView: View {
  var body: some View {
    List {
      ForEach(profileListData, id: \.title) { profileListItem in
        ProfileListItemCell(profileListItem: profileListItem) .frame(maxWidth: UIScreen.main.bounds.width * 0.95, idealHeight: UIScreen.main.bounds.height * 0.3).padding(.bottom,15).listRowSeparator(.hidden)
        
      }
    }.listStyle(.plain)
  }
}

struct ProfileListView_Previews: PreviewProvider {
  static var previews: some View {
    ProfileListView()
  }
}
