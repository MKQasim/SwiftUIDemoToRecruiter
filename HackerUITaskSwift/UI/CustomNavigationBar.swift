  //
  //  CustomNavigationBar.swift
  //  HackerUITaskSwift
  //
  //  Created by KamsQue on 22/03/2023.
  //

import SwiftUI

struct IdentifiableNavigationItem: Identifiable {
  let id = UUID()
  let item: AnyView
  
  var view: AnyView {
    item
  }
}

enum NavigationItemType {
  case backButton(action: () -> Void)
  case profileButton(action: () -> Void)
  case moreButton(action: () -> Void)
  case doubleTitleText(title: String ,  subTitle: String)
  case customButton(view: AnyView)
  case spacer
  
  var view: AnyView {
    switch self {
    case .backButton(let action):
      return AnyView(
        Button(action: action) {
          Image("leftback")
            .renderingMode(.template)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 32, height: 32)
            .foregroundColor(.white)
            .padding(.trailing,15)
        }
      )
    case .profileButton(let action):
      return AnyView(
        Button(action: action) {
          Image("navprofile")
//            .renderingMode(.template)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 44, height: 44)
//            .foregroundColor(.white)
            .padding(.trailing,15)
        }
      )
    case .moreButton(action: let action):
      return AnyView(
        Button(action: action) {
          Image("more")
            .renderingMode(.template)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 32, height: 32)
            .foregroundColor(.white)
        }
      )
    case .doubleTitleText(title:let title ,subTitle: let subTitle):
      return AnyView(
        VStack{
          Text(title)
            .frame(width: .infinity, height: 20,alignment: .leading)
            .font(.system(size: 10))
            .fontWeight(.bold)
            .foregroundColor(Color.white)
          
          Text(subTitle )
            .frame(width: .infinity, height: 20, alignment: .leading)
            .font(.system(size: 12))
            .fontWeight(.regular)
            .foregroundColor(Color.white)
        }
      )
    case .customButton(let view):
      return view
    case .spacer:
      return AnyView(Spacer())
    }
  }
}

protocol NavigationItem {
  var view: AnyView { get }
}

struct LeftNavigationItem: NavigationItem {
  let view: AnyView
  
  init(_ type: NavigationItemType, spacer: Bool = false) {
    let itemView = type.view
    let spacerView = spacer ? AnyView(Spacer()) : AnyView(EmptyView())
    self.view = AnyView(HStack (spacing: 15){
      spacerView
      itemView
    })
  }
}

struct RightNavigationItem: NavigationItem {
  let view: AnyView
  
  init(_ type: NavigationItemType, spacer: Bool = false) {
    let itemView = type.view
    let spacerView = spacer ? AnyView(Spacer()) : AnyView(EmptyView())
    self.view = AnyView(HStack {
      itemView
      spacerView
    })
  }
}

struct NavigationTitleView: View {
  let title: String
  let color: Color
  
  var body: some View {
    Text(title)
      .frame(maxWidth: title.count == 0 ? .zero : .infinity)
      .font(.headline)
      .foregroundColor(color)
  }
}

struct CurvedShapeView: Shape {
  let curveHeight: CGFloat
  
  func path(in rect: CGRect) -> Path {
    var path = Path()
    path.move(to: .zero)
    path.addLine(to: CGPoint(x: 0, y: curveHeight))
    path.addQuadCurve(to: CGPoint(x: rect.width, y: curveHeight), control: CGPoint(x: rect.width / 2, y: curveHeight + 20))
    path.addLine(to: CGPoint(x: rect.width, y: 0))
    path.closeSubpath()
    return path
    return path
  }
}

enum BackgroundStyle {
  case color(Color)
  case gradient(Gradient)
}

struct CurvedGradientNavigationView<Content: View>: View {
  let backgroundStyle: BackgroundStyle
  let content: Content
  let curveHeight: CGFloat
  let leftItems: [NavigationItem]?
  let rightItems: [NavigationItem]?
  let title: String
  let titleColor: Color
  
  init(title: String,
       backgroundStyle: BackgroundStyle,
       titleColor: Color = .white,
       curveHeight: CGFloat = 80,
       leftItems: [NavigationItem]? = nil,
       rightItems: [NavigationItem]? = nil,
       @ViewBuilder content: () -> Content) {
    self.title = title
    self.backgroundStyle = backgroundStyle
    self.titleColor = titleColor
    self.curveHeight = curveHeight
    self.leftItems = leftItems
    self.rightItems = rightItems
    self.content = content()
  }
  
  var body: some View {
    ZStack {
      VStack(spacing: 0) {
        curvedBackground
        content
      }
    }
  }
  
  private var curvedBackground: some View {
    ZStack {
      CurvedShapeView(curveHeight: curveHeight)
        .fill(backgroundFill)
        .frame(height: curveHeight)
      HStack(spacing: 0) {
        if let leftItems = leftItems {
          ForEach(leftItems.map { IdentifiableNavigationItem(item: $0.view) }, id: \.id) { item in
            item.view
              .padding(.leading, 0)
//              .padding(.top, curveHeight / 2)
          }
        }
        Spacer()
        NavigationTitleView(title: title, color: titleColor)
          .frame(width: title.count > 0 ? .infinity : .zero ,alignment: .center)
//          .padding(.top, curveHeight / 2)
        Spacer()
        if let rightItems = rightItems {
          ForEach(rightItems.map { IdentifiableNavigationItem(item: $0.view) }, id: \.id) { item in
            item.view
              .padding(.trailing, 0)
//              .padding(.top, curveHeight / 2)
          }
        }
      }
      .padding(.horizontal, 16)
      
    }
  }
  
  @ViewBuilder
  private var backgroundView: some View {
    switch backgroundStyle {
    case .color(let color):
      color
    case .gradient(let gradient):
      LinearGradient(gradient: gradient, startPoint: .top, endPoint: .bottom)
    }
  }
  
  private var backgroundFill: some ShapeStyle {
    switch backgroundStyle {
    case .color(let color):
      return AnyShapeStyle(color.opacity(0.8))
    case .gradient(let gradient):
      return AnyShapeStyle(LinearGradient(gradient: gradient, startPoint: .top, endPoint: .bottom))
    }
  }
}

struct CurvedGradientNavigation<Content: View>: View {
  var title: String
  var titleColor: Color = .white
  var backgroundColor: Color
  var content: Content
  var leftItems: [AnyView]?
  var rightItems: [AnyView]?
  var curveHeight: CGFloat = 50
  var gradientColors: [Color]?
  
  init(title: String, backgroundColor: Color, @ViewBuilder content: () -> Content) {
    self.title = title
    self.backgroundColor = backgroundColor
    self.content = content()
  }
  
  var body: some View {
    ZStack {
      backgroundColor.edgesIgnoringSafeArea(.all)
      
      VStack(spacing: 0) {
        ZStack {
          CurvedShape(curveHeight: curveHeight)
            .fill(
              LinearGradient(
                gradient: Gradient(colors: gradientColors ?? [backgroundColor, backgroundColor.opacity(0.8)]),
                startPoint: .top,
                endPoint: .bottom
              )
            )
            .frame(height: curveHeight)
          
          HStack {
            if let leftItems = leftItems {
              HStack(spacing: 16) {
                ForEach(leftItems.indices, id: \.self) { index in
                  leftItems[index]
                }
              }
              .padding(.leading, 16)
            }
            
            Spacer()
            
            Text(title)
            frame(width: title.count > 0 ? .infinity : .zero , height: 40)
              .font(.headline)
              .foregroundColor(titleColor)
              .padding(.top, curveHeight/2)
            
            Spacer()
            
            if let rightItems = rightItems {
              HStack(spacing: 16) {
                ForEach(rightItems.indices, id: \.self) { index in
                  rightItems[index]
                }
              }
              .padding(.trailing, 16)
            }
          }
          .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top ?? 0)
          .padding(.horizontal, 16)
        }
        
        content
      }
    }
  }
}



