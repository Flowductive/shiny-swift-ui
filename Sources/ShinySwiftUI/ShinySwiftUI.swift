//
//  ShinySwiftUI.swift
//
//
//  Created by Ben Myers on 11/22/21.
//

import SwiftUI

public struct ShinySwiftUI {
  
  // MARK: - Public Static Properties
  
  /// The `UserDefaults` key for whether buttons with shortcuts should display the shortcut's tooltip.
  public static let shortcutTooltipDefaultsKey = "shortcut_tooltip_enable"
  
  // MARK: - Public Static Methods
  
  /**
   Prepares the default values provided by the package.
   */
  public static func prepare() {
    UserDefaults.standard.register(defaults: [shortcutTooltipDefaultsKey : true])
  }
}
