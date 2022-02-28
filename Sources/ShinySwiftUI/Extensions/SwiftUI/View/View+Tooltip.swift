//
//  View+Tooltip.swift
//  
//
//  Created by Ben Myers on 2/21/22.
//

import SwiftUI

@available(macOS 11.0, iOS 13.4, *)
public extension View {
  
  // MARK: - Public Methods
  
  /**
   Adds a tooltip to the view.
   
   - parameter content: The content to display within the tooltip.
   */
  @ViewBuilder
  func withTooltip<V>(present: Binding<Bool>? = nil, extraOffset: CGFloat = 0.0, content: () -> V) -> some View where V: View {
    TooltipView(content: { self }, tooltipContent: content, hover: present, extraOffset: extraOffset)
  }
}

@available(macOS 11.0, iOS 13.4, *)
fileprivate struct TooltipView<Content, TooltipContent>: View where Content: View, TooltipContent: View {

  @ViewBuilder var content: Content
  @ViewBuilder var tooltipContent: TooltipContent
  var hover: Binding<Bool>?
  var extraOffset: CGFloat = 0.0
  @State private var autoHover: Bool = false
  
  var show: Bool {
    if let hover = hover {
      return hover.wrappedValue
    } else {
      return autoHover
    }
  }
  
  var body: some View {
    content
      .onHover {
        if hover == nil {
          autoHover = $0
        }
      }
      .overlay(
        tooltipContent
          .padding(.xs)
          .background(background)
          .cornerRadius(.s)
          .roundedBorder(Color.primary.opacity(0.2), cornerRadius: .s)
          .opacity(show ? .opaque : .invisible)
          .offset(y: show ? -35.0 - extraOffset : -25.0)
          .slickAnimation(value: show)
      )
  }
  
  var background: some View {
    #if os(macOS)
    return VisualEffectView(material: .toolTip)
    #else
    return VisualEffectView()
    #endif
  }
}
