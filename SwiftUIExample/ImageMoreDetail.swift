//
//  ImageMoreDetail.swift
//  ImageMoreDetail
//
//  Created by Kotaro Fukuo on 2021/08/23.
//

import SwiftUI

struct ImageMoreDetail: View {
  @Binding var string: String

  var body: some View {
    VStack {
      Text("Hello, World!")
      TextField(
        "Placeholder",
        text: $string
      )
        .textFieldStyle(.roundedBorder)
        .font(.title3)
        .padding([.top, .leading, .trailing], 30)
    }
  }
}

struct ImageMoreDetail_Previews: PreviewProvider {
  static var previews: some View {
    ImageMoreDetail(string: .constant("Hello, World!"))
  }
}
