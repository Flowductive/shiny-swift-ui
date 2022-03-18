//
//  ShoveView.swift
//  
//
//  Created by Ben Myers on 3/17/22.
//

import SwiftUI

/**
 A wrapper view used to shove views in specific directions.
 */
public struct ShoveView<Content>: View where Content: View {
  
  // MARK: - Public Properties
  
  /// The content to shove.
  @ViewBuilder public var content: Content
  
  /// The direction to shove in.
  public var shove: UnitPoint
  
  // MARK: - Body View
  
  public var body: some View {
    Group {
      if shove == .trailing {
        HStack { Spacer(); content }
      } else if shove == .leading {
        HStack { content; Spacer() }
      } else if shove == .top {
        VStack { content; Spacer() }
      } else if shove == .bottom {
        VStack { Spacer(); content }
      } else if shove == .topLeading {
        HStack { VStack { content; Spacer() }; Spacer() }
      } else if shove == .topTrailing {
        HStack { Spacer(); VStack { content; Spacer() } }
      } else if shove == .bottomLeading {
        HStack { VStack { Spacer(); content }; Spacer() }
      } else if shove == .bottomTrailing {
        HStack { Spacer(); VStack { Spacer(); content } }
      } else { content }
    }
  }
  
  // MARK: - Initalizers
  
  public init(_ shove: UnitPoint, @ViewBuilder content: () -> Content) {
    self.shove = shove
    self.content = content()
  }
}
