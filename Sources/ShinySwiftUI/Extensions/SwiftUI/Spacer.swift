//
//  Spacer.swift
//  
//
//  Created by Ben Myers on 11/7/21.
//

import SwiftUI

@available(macOS 10.15, iOS 13.0, *)
public extension Spacer {
  
  // MARK: - Public Static Methods
  
  /// An extra, extra small vertical spacer.
  static var VXXS: some View {
    Spacer().frame(height: .xxs)
  }
  
  /// An extra small vertical spacer.
  static var VXS: some View {
    Spacer().frame(height: .xs)
  }
  
  /// A small vertical spacer.
  static var VS: some View {
    Spacer().frame(height: .s)
  }
  
  /// A medium vertical spacer.
  static var VM: some View {
    Spacer().frame(height: .m)
  }
  
  /// A large vertical spacer.
  static var VL: some View {
    Spacer().frame(height: .l)
  }
  
  /// An extra large vertical spacer.
  static var VXL: some View {
    Spacer().frame(height: .xl)
  }
  
  /// An extra, extra large vertical spacer.
  static var VXXL: some View {
    Spacer().frame(height: .xxl)
  }
  
  /// An extra, extra small horizontal spacer.
  static var HXXS: some View {
    Spacer().frame(width: .xxs)
  }
  
  /// An extra small horizontal spcaer.
  static var HXS: some View {
    Spacer().frame(width: .xs)
  }
  
  /// A small horizontal spacer.
  static var HS: some View {
    Spacer().frame(width: .s)
  }
  
  /// A medium horizontal spacer.
  static var HM: some View {
    Spacer().frame(width: .m)
  }
  
  /// A large horizontal spacer.
  static var HL: some View {
    Spacer().frame(width: .l)
  }
  
  /// An extra large horizontal spacer.
  static var HXL: some View {
    Spacer().frame(width: .xl)
  }
  
  /// An extra, extra large horizontal spacer.
  static var HXXL: some View {
    Spacer().frame(width: .xxl)
  }
}
