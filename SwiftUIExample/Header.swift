//
//  Header.swift
//  Header
//
//  Created by Kotaro Fukuo on 2021/08/22.
//

import SwiftUI

struct Header: View {
  private let rowViews = Array<RowView>(repeating: RowView(), count: 20)

  var body: some View {
    ScrollView(.horizontal, showsIndicators: false) {
      HStack {
        ForEach(rowViews) { rowView in
          NavigationLink(destination: RowDetailView()) {
            rowView
          }
        }
      }
    }
    .padding([.top, .bottom], 20)
    .background(Color.yellow)
    .padding([.leading, .trailing], 20)
  }
}

struct Header_Previews: PreviewProvider {
  static var previews: some View {
    Header()
      .padding()
      .previewLayout(PreviewLayout.sizeThatFits)
  }
}
