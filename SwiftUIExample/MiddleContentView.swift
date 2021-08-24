//
//  MiddleContentView.swift
//  MiddleContentView
//
//  Created by Kotaro Fukuo on 2021/08/22.
//

import SwiftUI

struct MiddleContentView: View {
  @State private var string = ""

  var body: some View {
    VStack(spacing: 0) {
      HitTestView()
      Button(action: {
        string += "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
      }, label: {
        HStack {
          Spacer()
          Text("add String!")
            .foregroundColor(Color.white)
          Spacer()
        }
        .frame(height: 45)
        .background(Color.blue)
        .cornerRadius(10)
      })
      Text(string)
        .padding([.trailing, .leading], 20)
        .background(Color.red)
        .padding([.top, .bottom], 40)
    }
    .padding(20)
  }
}

private extension MiddleContentView {
  struct HitTestView: View {
    var body: some View {
      ZStack {
        Button {
          print(">>> tap Button!!!")
        } label: {
          Text("Button")
        }
        .frame(width: 100, height: 100)
        .background(Color.blue)
        Rectangle()
          .fill(Color.red.opacity(0.2))
          .frame(width: 300, height: 300)
          .allowsHitTesting(false)
      }
    }
  }
}

struct MiddleContentView_Previews: PreviewProvider {
  static var previews: some View {
    MiddleContentView()
      .padding()
      .previewLayout(PreviewLayout.sizeThatFits)
  }
}
