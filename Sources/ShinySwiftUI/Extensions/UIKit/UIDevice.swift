//
//  UIDevice.swift
//  
//
//  Created by Ben Myers on 2/3/22.
//

#if os(iOS)
import UIKit

public extension UIDevice {
  
  // MARK: - Public Static Properties
  
  /// Whether the device has a top notch (is iPhone X or above).
  static var hasTopNotch: Bool {
      if #available(iOS 13.0,  *) {
          return UIApplication.shared.windows.filter {$0.isKeyWindow}.first?.safeAreaInsets.top ?? 0 > 20
      } else {
          return UIApplication.shared.delegate?.window??.safeAreaInsets.top ?? 0 > 20
      }
  }
  
  /// Returns the size of the bottom bar (if on iPhone X or above).
  static var bottomBarHeight: CGFloat {
    if #available(iOS 13.0,  *) {
        return abs(UIApplication.shared.windows.filter {$0.isKeyWindow}.first?.safeAreaInsets.bottom ?? 0)
    } else {
        return abs(UIApplication.shared.delegate?.window??.safeAreaInsets.bottom ?? 0)
    }
  }
}

#endif
