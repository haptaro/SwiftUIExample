//
//  ExpandingLists.swift
//  ExpandingLists
//
//  Created by Kotaro Fukuo on 2021/08/27.
//

import SwiftUI

struct ProgrammingLanguage: Identifiable {
  var id = UUID()
  var name: String
  var use: [ProgrammingLanguage]? = nil
}


struct ExpandingLists: View {
  private let languages: [ProgrammingLanguage] = [
    .init(name: "Swift", use: [.init(name: "Mobile"), .init(name: "Server")]),
    .init(name: "Python", use: [.init(name: "Server"), .init(name: "ML")]),
    .init(name: "JavaScript", use: [.init(name: "Mobile"), .init(name: "Server"), .init(name: "Frontend")])
  ]

  @State private var isPresented = false
  
  var body: some View {
    VStack {
      Button(action: {
        isPresented.toggle()
      }, label: {
        HStack {
          Spacer()
          Text("Hello world!")
          Spacer()
        }
        .background(Color.red)
        .frame(height: 20)
      })
      List(languages, children: \.use, rowContent: { row in
        Text(row.name)
      })
      List(languages, children: \.use, rowContent: { row in
        Text(row.name)
      }).redacted(reason: .placeholder)
    }
    .sheet(isPresented: $isPresented) {
      Text("Foo")
        .hidden()
    }
  }
}

struct ExpandingLists_Previews: PreviewProvider {
  static var previews: some View {
    ExpandingLists()
  }
}
