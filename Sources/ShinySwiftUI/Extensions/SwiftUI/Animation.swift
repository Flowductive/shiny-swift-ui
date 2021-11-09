//
//  Animation.swift
//  
//
//  Created by Ben Myers on 11/8/21.
//

import SwiftUI

@available(macOS 10.15, iOS 13.0, *)
public extension Animation {
  
  // MARK: - Public Properties
  
  /// A slick ease out animation.
  ///
  /// To specify a duration, see ``slickEaseOut(duration:)``.
  static var slickEaseOut: Animation {
    Animation.timingCurve(0.25, 0.75, 0, 1, duration: 0.5)
  }
  
  /// A slick ease in animation.
  ///
  /// To specify a duration, see ``slickEaseIn(duration:)``.
  static var slickEaseIn: Animation {
    Animation.timingCurve(0.75, 0.25, 0, 1, duration: 0.5)
  }
  
  /// A bounce animation.
  static var bounce: Animation {
    return Animation.spring(response: 1.0, dampingFraction: 0.4, blendDuration: 1.0)
  }
  
  /// A lighter bounce animation.
  static var lightBounce: Animation {
    return Animation.spring(response: 0.8, dampingFraction: 0.7, blendDuration: 1.0)
  }
  
  // MARK: - Public Static Methods
  
  /**
   A slick ease out animation.
   
   - parameter duration: The duration of the animation.
   */
  static func slickEaseOut(duration: Double) -> Animation {
    Animation.timingCurve(0.25, 0.75, 0, 1, duration: duration)
  }
  
  /**
   A slick ease in animation.
   
   - parameter duration: The duration of the animation.
   */
  static func slickEaseIn(duration: Double) -> Animation {
    Animation.timingCurve(0.75, 0.25, 0, 1, duration: duration)
  }
}
