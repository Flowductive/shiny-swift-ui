//
//  File.swift
//  
//
//  Created by Ben Myers on 8/13/22.
//

import SwiftUI

public enum _SlickAnimationStyle {
  case `in`, out, `inOut`
  
  internal func animation(duration: TimeInterval, delay: TimeInterval) -> Animation {
    switch self {
    case .in: return .slickEaseIn(duration: duration).delay(delay)
    case .out: return .slickEaseOut(duration: duration).delay(delay)
    case .inOut: return .slickEaseInOut(duration: duration).delay(delay)
    }
  }
}
