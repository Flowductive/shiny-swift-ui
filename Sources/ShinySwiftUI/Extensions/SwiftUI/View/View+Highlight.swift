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
  func highlight(_ index: Int, monitoring value: Binding<Int?>) -> some View {
    HighlightView(content: { self }, index: index, value: value)
  }
}

@available(macOS 11.0, iOS 13.4, *)
fileprivate struct HighlightView<Content>: View where Content: View {
  
  @ViewBuilder var content: Content
  @State var animate: Bool = false
  
  var index: Int
  var value: Binding<Int?>
  
  var show: Bool {
    return value.wrappedValue ?? -99 == index
  }
  
  var body: some View {
    content
      .overlay(
        RoundedRectangle(cornerRadius: .xs)
          .stroke(value.wrappedValue == index ? .yellow : .clear, lineWidth: 2.0)
          .animation(.none, value: value.wrappedValue)
      )
      .slickAnimation(value: value.wrappedValue)
      .onAppear { animate = true }
      .overlay(
        Image(systemName: "chevron.down")
          .foregroundColor(.yellow.if(value == index))
          .animation(.lightBounce.repeatForever(autoreverses: false), value: animate)
          .offset(y: animate ? 10.0 : 0.0)
          .offset(y: -50.0)
      )
  }
}

fileprivate func == <T>(lhs: Binding<T>, rhs: T) -> Binding<Bool> where T: Equatable {
  Binding(
    get: {
      lhs.wrappedValue == rhs
    },
    set: {
      if $0 {
        lhs.wrappedValue = rhs
      }
    }
  )
}
