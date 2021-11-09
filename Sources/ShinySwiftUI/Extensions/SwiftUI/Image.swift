//
//  Image.swift
//  
//
//  Created by Ben Myers on 11/8/21.
//

import SwiftUI

@available(macOS 11.0, iOS 13.0, *)
public extension Image {
  
  // MARK: - Public Methods
  
  /**
   Returns a smaller version of the image.
   
   - returns: The image, in a smaller size
   */
  func small() -> some View {
    return imageScale(.small)
  }
  
  /**
   Returns a medium version of the image.
   
   - returns: The image, in a medium size
   */
  func medium() -> some View {
    return imageScale(.medium)
  }
  
  /**
   Returns a larger version of the image.
   
   - returns: The image, in a larger size
   */
  func large() -> some View {
    return imageScale(.large)
  }
  
  /**
   Returns a smaller version of the image, using `scaleEffect(_:)`.
   
   - returns: The image, in a smaller size
   */
  func smallScale() -> some View {
    return scaleEffect(0.783)
  }
  
  /**
   Returns a tiny version of the image, using `scaleEffect(_:)`.
   
   - returns: The image, in a tiny size
   */
  func tinyScale() -> some View {
    return scaleEffect(0.5)
  }
  
  /**
   Returns a smaller version of the image, using `scaleEffect(_:)`.
   
   - returns: The image, in a smaller size
   */
  func largeScale() -> some View {
    return scaleEffect(1.29)
  }
}
