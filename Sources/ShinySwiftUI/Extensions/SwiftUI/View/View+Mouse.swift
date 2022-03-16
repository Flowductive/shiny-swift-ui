//
//  View+Mouse.swift
//  
//
//  Created by Ben Myers on 2/11/22.
//  Credit: https://swiftui-lab.com/a-powerful-combo/
//

#if os(macOS)

import SwiftUI

public extension View {
  
  // MARK: - Public Methods
  
  /**
   Tracks the view.
   
   - parameter onMove: The handler for the mouse position updating.
   */
  func trackingMouse(onMove: @escaping (NSPoint) -> Void) -> some View {
    TrackinAreaView(onMove: onMove) { self }
  }
}

fileprivate struct TrackinAreaView<Content>: View where Content : View {
  let onMove: (NSPoint) -> Void
  let content: () -> Content
  
  init(onMove: @escaping (NSPoint) -> Void, @ViewBuilder content: @escaping () -> Content) {
    self.onMove = onMove
    self.content = content
  }
  
  var body: some View {
    TrackingAreaRepresentable(onMove: onMove, content: self.content())
  }
}

fileprivate struct TrackingAreaRepresentable<Content>: NSViewRepresentable where Content: View {
  let onMove: (NSPoint) -> Void
  let content: Content
  
  func makeNSView(context: Context) -> NSHostingView<Content> {
    return TrackingNSHostingView(onMove: onMove, rootView: self.content)
  }
  
  func updateNSView(_ nsView: NSHostingView<Content>, context: Context) {
  }
}

fileprivate class TrackingNSHostingView<Content>: NSHostingView<Content> where Content : View {
  let onMove: (NSPoint) -> Void
  
  init(onMove: @escaping (NSPoint) -> Void, rootView: Content) {
    self.onMove = onMove
    
    super.init(rootView: rootView)
    
    setupTrackingArea()
  }
  
  required init(rootView: Content) {
    fatalError("init(rootView:) has not been implemented")
  }
  
  @objc required dynamic init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func setupTrackingArea() {
    let options: NSTrackingArea.Options = [.mouseMoved, .activeAlways, .inVisibleRect]
    self.addTrackingArea(NSTrackingArea.init(rect: .zero, options: options, owner: self, userInfo: nil))
  }
  
  override func mouseMoved(with event: NSEvent) {
    self.onMove(self.convert(event.locationInWindow, from: nil))
  }
}

#endif
