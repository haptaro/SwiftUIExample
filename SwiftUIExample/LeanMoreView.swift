//
//  LeanMoreView.swift
//  LeanMoreView
//
//  Created by Kotaro Fukuo on 2021/08/27.
//

import SwiftUI

enum Mode: Equatable {
  case stop
  case playing
  case finished
}

struct LeanMoreView: View {
  
  @State private var mode: Mode = .stop
  
  var body: some View {
    VStack {
      Button(action: {
        mode = .stop
      }) {
        Text("Change to stop")
      }
      Button(action: {
        mode = .playing
      }) {
        Text("Change to playing")
      }
      Button(action: {
        mode = .finished
      }) {
        Text("Change to finished")
      }
    }
    .onChange(of: mode) { [mode] newValue in
      print("oldValue: \(mode)")
      print("newValue: \(newValue)")
    }
  }
}

struct LeanMoreView_Previews: PreviewProvider {
  static var previews: some View {
    LeanMoreView()
  }
}
