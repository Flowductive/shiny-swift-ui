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
  
  static var turn: AnyTransition {
    AnyTransition.asymmetric(insertion: turnFromBottom, removal: turnFromTop)
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
