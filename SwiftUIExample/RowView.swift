//
//  RowView.swift
//  RowView
//
//  Created by Kotaro Fukuo on 2021/08/22.
//

import SwiftUI

struct RowView: View, Identifiable {
  let id = UUID()

  var body: some View {
    VStack(alignment:.leading, spacing: 0) {
      Text("name")
      Text("age")
      Image("pepa")
        .resizable()
        .clipShape(Circle())
        .frame(width: 80, height: 80)
        .padding(10)
      Text("description")
    }
    .padding()
    .background(Color.gray)
    .cornerRadius(20)
  }
}

struct RowView_Previews: PreviewProvider {
  static var previews: some View {
    RowView()
      .padding()
      .previewLayout(PreviewLayout.sizeThatFits)
  }
}
