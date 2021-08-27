//
//  ContentView.swift
//  SwiftUIExample
//
//  Created by Kotaro Fukuo on 2021/08/22.
//

import SwiftUI

struct ContentView: View {
  var body: some View {
    NavigationView {
      ScrollView(showsIndicators: false) {
        VStack(spacing: 0) {
          Header()
          MiddleContentView()
          Footer()
        }
      }
      .navigationTitle("Home")
      .toolbar(content: {
        ToolbarItem(placement: ToolbarItemPlacement.navigationBarTrailing) {
          NavigationLink(destination: {}, label: {
            Text("Settings")
          })
        }
      })
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      ContentView()
      ContentView()
        .previewDevice("iPhone SE (2nd generation)")
      ContentView()
        .previewDevice("iPhone 12 Pro Max")
    }
  }
}
