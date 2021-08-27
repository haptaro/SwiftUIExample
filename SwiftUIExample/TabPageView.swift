//
//  TabPageView.swift
//  TabPageView
//
//  Created by Kotaro Fukuo on 2021/08/27.
//

import SwiftUI

struct TabPageView: View {
  @Binding var isShowTabPageView: Bool

  var body: some View {
    TabView {
      ZStack {
        Color.red
        Text("Text1")
      }
      .ignoresSafeArea()
      ZStack {
        Color.blue
        Text("Text2")
      }
      .ignoresSafeArea()
      ZStack {
        Color.pink
        Text("Text3")
      }
      .ignoresSafeArea()
      ZStack {
        Color.gray
        Text("Text3")
      }
      .ignoresSafeArea()
      ZStack {
        Color.yellow
        Text("Text4")
      }
      .ignoresSafeArea()
      ZStack {
        Color.cyan
        VStack {
          Text("Text5")
          Button {
            isShowTabPageView = false
          } label: {
            Text("Close")
          }
        }
      }
      .ignoresSafeArea()
    }
    .tabViewStyle(.page)
  }
}

struct TabPageView_Previews: PreviewProvider {
  static var previews: some View {
    TabPageView(isShowTabPageView: .constant(false))
  }
}
