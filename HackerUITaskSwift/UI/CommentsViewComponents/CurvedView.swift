  //
  //  TopProfileBtn.swift
  //  HackerUITaskSwift
  //
  //  Created by KamsQue on 22/03/2023.
  //

import SwiftUI

struct CurvedView: View {
  let colors = Gradient(colors: [.black, .init(uiColor: UIColor(red: 45/255, green: 45/255, blue: 45/255, alpha: 1))])
  let startPoint = UnitPoint(x: 0.5, y: 0)
  let endPoint = UnitPoint(x: 0.5, y: 1)
  var totalHeight: Double = 340
  var curvedHeight: Double = 360
  var height: CGFloat {
    CGFloat(totalHeight - curvedHeight)
  }
  
  var body: some View {
    GeometryReader { geometry in
      ZStack {
        Rectangle()
          .fill(LinearGradient(gradient: colors, startPoint: startPoint, endPoint: endPoint))
          .frame(width: geometry.size.width, height: height)
          // Reduce the height to 120
        
        Path { path in
          path.move(to: CGPoint(x: 0, y: totalHeight)) // Start at the new height
          path.addQuadCurve(to: CGPoint(x: geometry.size.width, y: totalHeight), control: CGPoint(x: geometry.size.width * 0.5, y: curvedHeight)) // Adjust the y value of the control point
          path.addLine(to: CGPoint(x: geometry.size.width, y: 0))
          path.addLine(to: CGPoint(x: 0, y: 0))
          path.closeSubpath()
        }
        .fill(LinearGradient(gradient: colors, startPoint: startPoint, endPoint: endPoint))
        
      }
    }
  }
}

struct ProfileCurvedView_Previews: PreviewProvider {
  static var previews: some View {
    CurvedShape()
  }
}

struct CurvedShape: Shape {
  var curveHeight: CGFloat = 50
  
  func path(in rect: CGRect) -> Path {
    var path = Path()
    path.move(to: CGPoint(x: 0, y: rect.maxY))
    path.addQuadCurve(to: CGPoint(x: rect.maxX, y: rect.maxY), control: CGPoint(x: rect.midX, y: rect.maxY - curveHeight))
    path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
    path.addLine(to: CGPoint(x: 0, y: rect.minY))
    path.closeSubpath()
    return path
  }
}
