//
//  Line.swift
//  
//
//  Created by Ben Myers on 8/13/22.
//

import SwiftUI

/**
 A line shape.
 */
public struct Line: Shape {
  public func path(in rect: CGRect) -> Path {
    var path = Path()
    path.move(to: CGPoint(x: 0, y: 0))
    path.addLine(to: CGPoint(x: rect.width, y: 0))
    return path
  }
  
  public init() {}
}
