//
//  _OpacityLevel.swift
//  
//
//  Created by Ben Myers on 12/5/21.
//

import SwiftUI

public enum _OpacityLevel: CGFloat {
  
  /// Fully opaque.
  case opaque = 1.0
  
  /// Mostly opaque.
  case most = 0.75
  
  /// Half opaque.
  case half = 0.5
  
  /// Quarter opaque.
  case quarter = 0.25
  
  /// Almost invisible.
  case almostInvisible = 0.00001
  
  /// Invisible.
  case invisible = 0.0
}

