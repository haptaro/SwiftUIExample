//
//  Footer.swift
//  Footer
//
//  Created by Kotaro Fukuo on 2021/08/23.
//

import SwiftUI

struct Footer: View {
  var body: some View {
    NavigationLink(destination: ImageDetailView()) {
      Image("pepa")
        .resizable()
        .scaledToFit()
        .background(Color.blue)
        .padding([.leading, .trailing], 20)
    }
  }
}

struct Footer_Previews: PreviewProvider {
  static var previews: some View {
    Footer()
  }
}
