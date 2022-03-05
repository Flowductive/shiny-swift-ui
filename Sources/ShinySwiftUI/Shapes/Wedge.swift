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
  var startAngle: Double
  /// The end angle of the wedge.
  var endAngle: Double
  /// Whether the wedge moves clockwise.
  var clockwise: Bool
  
  // MARK: - Implementation

  public func path(in rect: CGRect) -> Path {
    var path = Path()
    let radius = max(rect.size.width, rect.size.height) / 2
    path.move(to: .init(x: rect.midX, y: rect.midY))
    path.addArc(center: CGPoint(x: rect.midX, y: rect.midY),
                radius: radius,
                startAngle: .radians(startAngle),
                endAngle: .radians(endAngle),
                clockwise: clockwise)
    path.move(to: .init(x: rect.midX, y: rect.midY))
    return path
  }
  
  public var animatableData: Double {
    get { endAngle }
    set { endAngle = newValue }
  }
  
  // MARK: - Public Initalizers
  
  public init(from startAngle: Double = 0.0, to endAngle: Double, clockwise: Bool = true) {
    self.startAngle = startAngle
    self.endAngle = endAngle
    self.clockwise = clockwise
  }
}
