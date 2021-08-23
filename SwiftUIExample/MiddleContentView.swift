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

struct MiddleContentView_Previews: PreviewProvider {
  static var previews: some View {
    MiddleContentView()
      .padding()
      .previewLayout(PreviewLayout.sizeThatFits)
  }
}
