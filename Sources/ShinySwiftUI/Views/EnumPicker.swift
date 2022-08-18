//
//  EnumPicker.swift
//  
//
//  Created by Ben Myers on 8/11/22.
//

import SwiftUI

public struct EnumPicker<T: Hashable & CaseIterable & Equatable, V: View>: View {
  
  // MARK: - Public Properties
  
  /// The selected value.
  @Binding public var selected: T
  
  /// The title of the picker.
  public var title: String?
  
  /// The picker's content.
  public let mapping: (T) -> V
  
  // MARK: - Public Body View
  
  public var body: some View {
    Picker(selection: $selected, label: Text(title ?? "")) {
      ForEach(Array(T.allCases), id: \.self) {
        mapping($0).tag($0)
      }
    }
  }
  
  // MARK: - Initalizers
  
  public init(selected: Binding<T>, title: String? = nil, mapping: @escaping (T) -> V) {
    self._selected = selected
    self.title = title
    self.mapping = mapping
  }
}

public extension EnumPicker where T: RawRepresentable, V == Text {
  
  // MARK: - Initalizers
  
  init(selected: Binding<T>, title: String? = nil) {
    self.init(selected: selected, title: title, mapping: { val in Text(String(describing: val.rawValue)) })
  }
}
