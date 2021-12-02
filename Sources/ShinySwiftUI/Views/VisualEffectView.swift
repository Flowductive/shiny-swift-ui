//
//  VisualEffectView.swift
//  
//
//  Created by Ben Myers on 11/29/21.
//

import SwiftUI

#if os(macOS)
public struct VisualEffectView: NSViewRepresentable {
  
  // MARK: - Public Properties
  
  /// The material of the visual effect view.
  public var material: NSVisualEffectView.Material
  /// Whether the view blends within the window.
  public var blendingMode: NSVisualEffectView.BlendingMode
  
  // MARK: - Initalizers
  
  public init(material: NSVisualEffectView.Material = .popover, blendingMode: NSVisualEffectView.BlendingMode = .withinWindow) {
    self.material = material
    self.blendingMode = blendingMode
  }
  
  // MARK: - Overidden Methods
  
  public func makeNSView(context: Context) -> NSVisualEffectView {
    let visualEffectView = NSVisualEffectView()
    visualEffectView.material = material
    visualEffectView.blendingMode = blendingMode
    visualEffectView.state = NSVisualEffectView.State.active
    return visualEffectView
  }
  
  public func updateNSView(_ visualEffectView: NSVisualEffectView, context: Context) {
    visualEffectView.material = material
    visualEffectView.blendingMode = blendingMode
  }
}
#endif

#if os(iOS)
import UIKit

public struct VisualEffectView: UIViewRepresentable {
  
  // MARK: - Wrapped Properties
  
  /// The current color scheme.
  @Environment(\.colorScheme) var colorScheme
  
  // MARK: - Public Properties
  
  /// The effect for the view.
  public var effect: UIVisualEffect?
  
  // MARK: - Initalizers
  
  public init(effect: UIVisualEffect? = nil) {
    self.effect = effect
  }
  
  // MARK: - Overidden Methods
  
  public func makeUIView(context: UIViewRepresentableContext<Self>) -> UIVisualEffectView {
    UIVisualEffectView()
  }
  
  public func updateUIView(_ uiView: UIVisualEffectView, context: UIViewRepresentableContext<Self>) {
    if effect == nil {
      uiView.effect = UIBlurEffect(style: colorScheme == .dark ? .dark : .light)
    } else {
      uiView.effect = effect
    }
  }
}
#endif
