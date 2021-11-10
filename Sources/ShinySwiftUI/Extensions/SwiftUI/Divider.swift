//
//  Divider.swift
//  
//
//  Created by Ben Myers on 11/9/21.
//

import SwiftUI

@available(macOS 10.15, iOS 11.0, *)
public extension Divider {
  
  // MARK: - Public Static Methods
  
  /**
   A horizontal divider with a specified size.
   
   - parameter width: The divider's width.
   */
  static func H(_ width: CGFloat = .xl) -> some View {
    Divider().frame(width: width)
  }
  
  /**
   A vertical divider with a specifed size.
   
   - parameter height: The divider's height.
   */
  static func V(_ height: CGFloat = .xl) -> some View {
    Divider().frame(height: height)
  }
}
