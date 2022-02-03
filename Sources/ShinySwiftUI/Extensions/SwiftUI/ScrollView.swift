//
//  File.swift
//  
//
//  Created by Ben Myers on 2/3/22.
//

import SwiftUI

public extension ScrollView {
  
  // MARK: - Public Methods
  
  /**
   Reports the y-offset of a scroll view to a binding variable.
   
   ⚠️ **Note (1/2): ** You'll need to add the `.coordinateSpace(name: "scroll")` modifier to your `ScrollView` like so:
   
   ```
   ScrollView {
    // ...
   }
   .coordinateSpace(name: "scroll")
   ```
   
   ⚠️ **Note (2/2):** This does not yet work with horizontal scroll views.
   
   - parameter offset: The variable to report y-offset scroll to.
   - returns: The view, updating the `offset` parameter with the scroll offset.
   */
  @ViewBuilder func reportScrollOffset(to offset: Binding<CGFloat>) -> some View {
    self.background(
      GeometryReader {
        Color.clear.preference(key: ViewOffsetKey.self, value: -$0.frame(in: .named("scroll")).origin.y)
      }
    )
      .onPreferenceChange(ViewOffsetKey.self) {
        offset.wrappedValue = $0
      }
  }
}

fileprivate struct ViewOffsetKey: PreferenceKey {
    typealias Value = CGFloat
    static var defaultValue = CGFloat.zero
    static func reduce(value: inout Value, nextValue: () -> Value) {
        value += nextValue()
    }
}
