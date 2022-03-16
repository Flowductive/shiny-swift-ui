//
//  View+Highlight.swift
//  
//
//  Created by Ben Myers on 3/16/22.
//

import SwiftUI

@available(macOS 11.0, iOS 13.4, *)
public extension View {
  
  // MARK: - Public Methods
  
  /**
   Highlights the view if the provided `Binding` value matches.
   
   - parameter index: The index of the highlighted view.
   - parameter value: The `Binding` value to check. If it matches `index`, the highlight will display.
   */
  @ViewBuilder
  func highlight(_ index: Int, monitoring value: Binding<Int>) -> some View {
    self.roundedBorder(index == value.wrappedValue ? .accentColor : .clear, cornerRadius: .m, lineWidth: 4.0)
  }
}
