//
//  File.swift
//  
//
//  Created by Ben Myers on 11/7/21.
//

import SwiftUI

@available(macOS 11.0, iOS 13.0, *)
public extension Text {
  
  // MARK: - Public Static Methods
  
  /**
   A header 1 style text format.
   
   - parameter content: The content of the text, as a `String`.
   - returns: The inputted text, in a header 1 format
   */
  static func H1(_ content: String) -> Text {
    return Text(content).font(.title).fontWeight(.bold)
  }
  
  /**
   A header 2 style text format.
   
   - parameter content: The content of the text, as a `String`.
   - returns: The inputted text, in a header 2 format
   */
  static func H2(_ content: String) -> Text {
    return Text(content).font(.title2).fontWeight(.bold)
  }
  
  /**
   A header 3 style text format.
   
   - parameter content: The content of the text, as a `String`.
   - returns: The inputted text, in a header 3 format
   */
  static func H3(_ content: String) -> Text {
    return Text(content).font(.title3).fontWeight(.bold)
  }
  
  /**
   A paragraph style text format.
   
   - parameter content: The content of the text, as a `String`.
   - returns: The inputted text, in a paragraph format
   */
  static func P(_ content: String) -> Text {
    return Text(content).font(.body)
  }
  
  /**
   A secondary paragraph style text format.
   
   - parameter content: The content of the text, as a `String`.
   - returns: The inputted text, in a secondary paragraph format
   */
  static func P2(_ content: String) -> Text {
    return Text(content).font(.caption)
  }
  
  /**
   A tertiary paragraph style text format.
   
   - parameter content: The content of the text, as a `String`.
   - returns: The inputted text, in a secondary paragraph format
   */
  static func P3(_ content: String) -> Text {
    return Text(content).font(.footnote)
  }
  
  /**
   A quaternary paragraph style text format.
   
   - parameter content: The content of the text, as a `String`.
   - returns: The inputted text, in a secondary paragraph format
   */
  static func P4(_ content: String) -> Text {
    return Text(content).font(Font.system(size: 9.0))
  }
}
