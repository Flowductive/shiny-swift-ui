//
//  SwiftUIView.swift
//  
//
//  Created by Ben Myers on 3/1/22.
//

import SwiftUI

/**
 A generic stack, used for cross-platform compatability.
 */
public struct GStack<Content>: View where Content: View {
  
  // MARK: - Private Wrapped Properties
  
  @ViewBuilder private var content: Content
  
  // MARK: - Private Properties
  
  private var mode: Direction
  private var spacing: CGFloat?
  private var alignment: SomeAlignment
  
  // MARK: - Body View
  
  public var body: some View {
    Group {
      if mode == .horizontal {
        HStack(alignment: alignment.forHStack, spacing: spacing) {
          content
        }
      } else if mode == .vertical {
        VStack(alignment: alignment.forVStack, spacing: spacing) {
          content
        }
      } else if mode == .overlap {
        ZStack {
          content
        }
      }
    }
  }
  
  // MARK: - Public Initalizers
  
  public init(_ mode: Direction, alignment: SomeAlignment = .center, spacing: CGFloat? = nil, @ViewBuilder content: () -> Content) {
    self.mode = mode
    self.alignment = alignment
    self.spacing = spacing
    self.content = content()
  }
  
  // MARK: - Enumerations
  
  public enum Direction  {
    case vertical, horizontal, overlap
  }
  
  public enum SomeAlignment {
    case beginning, center, end
    
    internal var forVStack: HorizontalAlignment {
      switch self {
      case .beginning: return .leading
      case .center: return .center
      case .end: return .trailing
      }
    }
    
    internal var forHStack: VerticalAlignment {
      switch self {
      case .beginning: return .top
      case .center: return .center
      case .end: return .bottom
      }
    }
  }
}
