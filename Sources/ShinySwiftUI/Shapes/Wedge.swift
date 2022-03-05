//
//  Wedge.swift
//  
//
//  Created by Ben Myers on 3/5/22.
//

import SwiftUI

/**
 A wedge shape.
 */
public struct Wedge: Shape {
  
  // MARK: - Properties
  
  /// The start angle of the wedge.
  var startAngle: Angle
  /// The end angle of the wedge.
  var endAngle: Angle
  /// Whether the wedge moves clockwise.
  var clockwise: Bool
  
  // MARK: - Implementation

  public func path(in rect: CGRect) -> Path {
    var path = Path()
    let radius = max(rect.size.width, rect.size.height) / 2
    path.move(to: .init(x: rect.midX, y: rect.midY))
    path.addArc(center: CGPoint(x: rect.midX, y: rect.midY),
                radius: radius,
                startAngle: startAngle,
                endAngle: endAngle,
                clockwise: clockwise)
    path.move(to: .init(x: rect.midX, y: rect.midY))
    return path
  }
  
  var animatableData: Angle {
      get { endAngle }
      set { endAngle = newValue }
  }
  
  // MARK: - Public Initalizers
  
  public init(from startAngle: Angle = .zero, to endAngle: Angle, clockwise: Bool = true) {
    self.startAngle = startAngle
    self.endAngle = endAngle
    self.clockwise = clockwise
  }
}
