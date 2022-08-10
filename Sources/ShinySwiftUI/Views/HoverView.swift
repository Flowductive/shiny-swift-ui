//
//  SwiftUIView.swift
//  
//
//  Created by Ben Myers on 8/10/22.
//

import SwiftUI

public struct HoverView<Content>: View where Content: View {
  
  // MARK: - Public Wrapped Properties
  
  /// The content to display.
  @ViewBuilder public let content: (Bool) -> Content
  
  /// Whether the view is hovered.
  @State public var hover: Bool = false

  // MARK: - Public Body View
  
  public var body: some View {
    content(hover).onHover { hover = $0 }
  }
  
  // MARK: - Public Initalizers
  
  public init(content: @escaping (Bool) -> Content) {
    self.content = content
  }
}
