//
//  ShareView.swift
//  ShareView
//
//  Created by Kotaro Fukuo on 2021/08/28.
//

import SwiftUI

struct ShareView: View {
  var body: some View {
    ZStack {
      Image("pepa")
      Text("Hello, World!")
        .padding(30)
        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 8))
    }
  }
}

struct ShareView_Previews: PreviewProvider {
  static var previews: some View {
    ShareView()
  }
}
