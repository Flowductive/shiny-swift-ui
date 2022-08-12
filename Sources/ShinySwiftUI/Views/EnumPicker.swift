//
//  EnumPicker.swift
//  
//
//  Created by Ben Myers on 8/11/22.
//

import SwiftUI

public struct EnumPicker<T: Hashable & CaseIterable, V: View>: View {
  
  // MARK: - Public Properties
  
  /// The selected value.
  public var selected: Binding<T>
  
  /// The title of the picker.
  public var title: String? = nil
  
  /// The picker's content.
  public let mapping: (T) -> V
  
  // MARK: - Public Body View
  
  public var body: some View {
    Picker(selection: selected, label: Text(title ?? "")) {
      ForEach(Array(T.allCases), id: \.self) {
        mapping($0).tag($0)
      }
    }
  }
  
  // MARK: - Initalizers
  
  public init(selected: Binding<T>, title: String? = nil, mapping: @escaping (T) -> V) {
    self.selected = selected
    self.title = title
    self.mapping = mapping
  }
}
