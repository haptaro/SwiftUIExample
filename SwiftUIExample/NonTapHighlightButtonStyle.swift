//
//  NonTapHighlightButtonStyle.swift
//  NonTapHighlightButtonStyle
//
//  Created by Kotaro Fukuo on 2021/08/28.
//

import SwiftUI

// To prevent tap hilight
struct NonTapHighlightButtonStyle: ButtonStyle {
  func makeBody(configuration: Configuration) -> some View {
    configuration
      .label
      .foregroundColor(.white)
      .background(.blue)
      .cornerRadius(10)
  }
}

extension ButtonStyle where Self == NonTapHighlightButtonStyle {
  static var nonTapHighlight: Self { Self() }
}
