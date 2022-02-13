//
//  AnyTransition.swift
//  
//
//  Created by Ben Myers on 2/13/22.
//

import SwiftUI

public extension AnyTransition {
  
  // MARK: - Public Static Properties
  
  /// An animation that turns the view from the bottom.
  static var turnFromBottom: AnyTransition {
    AnyTransition.modifier(active: TurnedViewModifier(.down, turn: true), identity: TurnedViewModifier(.down, turn: false))
  }
  
  /// An animation that turns the view from the top.
  static var turnFromTop: AnyTransition {
    AnyTransition.modifier(active: TurnedViewModifier(.up, turn: true), identity: TurnedViewModifier(.up, turn: false))
  }
  
  /// An animation that turns the view.
  static var turn: AnyTransition {
    AnyTransition.asymmetric(insertion: turnFromBottom, removal: turnFromTop)
  }
  
  /// A left swipe transition.
  static var swipeLeft: AnyTransition {
    AnyTransition.modifier(active: SwipeViewModifier(.left, active: true), identity: SwipeViewModifier(.left, active: false))
  }
  
  /// A right swipe transition.
  static var swipeRight: AnyTransition {
    AnyTransition.modifier(active: SwipeViewModifier(.right, active: true), identity: SwipeViewModifier(.right, active: false))
  }
  
  /// A page-wide transition for swiping.
  static var swipe: AnyTransition {
    AnyTransition.asymmetric(insertion: swipeRight, removal: swipeLeft)
  }
  
  /// A pop transition.
  static var pop: AnyTransition {
    AnyTransition.asymmetric(insertion: .identity, removal: .modifier(active: PopViewModifier(active: true), identity: PopViewModifier(active: false)))
  }
}

fileprivate struct PopViewModifier: ViewModifier {
  
  var active: Bool
  
  func body(content: Content) -> some View {
    content
      .opacity(active ? .invisible : .opaque)
      .scaleEffect(active ? 1.2 : 0.0)
  }
}

fileprivate struct SwipeViewModifier: ViewModifier {
  
  var direction: Direction
  var active: Bool
  
  init(_ direction: Direction, active: Bool) {
    self.direction = direction
    self.active = active
  }
  
  func body(content: Content) -> some View {
    content
      .offset(x: active ? direction == .right ? 200.0 : -200.0 : 0.0)
      .opacity(active ? .invisible : .opaque)
  }
  
  enum Direction {
    case left, right
  }
}


fileprivate struct TurnedViewModifier: ViewModifier {
  
  var direction: Direction
  var turn: Bool
  
  init(_ direction: Direction, turn: Bool) {
    self.direction = direction
    self.turn = turn
  }
  
  func body(content: Content) -> some View {
    content
      .opacity(turn ? .invisible : .opaque)
      .rotation3DEffect(.degrees(turn ? direction == .down ? -60.0 : 60.0 : 0.0), axis: (0.1, 0.0, 0.0))
      .offset(y: turn ? direction == .down ? 10.0 : -10.0 : 0.0)
  }
  
  enum Direction {
    case down, up
  }
}
