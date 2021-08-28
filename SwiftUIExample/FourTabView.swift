//
//  FourTabView.swift
//  FourTabView
//
//  Created by Kotaro Fukuo on 2021/08/27.
//

import SwiftUI

struct FourTabView: View {
    var body: some View {
      TabView {
        OneTab()
        TwoTab()
        ThreeTab()
        FourTab()
      }
      .font(.headline)
    }
}

private extension FourTabView {
  struct OneTab: View {
    var body: some View {
      Text("Contents1.1")
        .tabItem {
          Image(systemName: "1.square.fill")
          Text("Tab1")
        }
    }
  }
  
  struct TwoTab: View {
    struct ListData: Identifiable {
      var id = UUID()
      var name: String
    }
    private let listdatas: [ListData] = [
      .init(name: "a"),
      .init(name: "b"),
      .init(name: "c"),
      .init(name: "d"),
      .init(name: "e"),
      .init(name: "f"),
      .init(name: "g"),
      .init(name: "h")
    ]
    @State private var multiSelection = Set<UUID>()
    
    var body: some View {
      VStack {
        List(listdatas, selection: $multiSelection) { listData in
          Text(listData.name)
        }
        Text("selection: \(multiSelection.count)")
        Spacer()
      }
      .tabItem {
        Image(systemName: "1.square.fill")
        Text("Tab2")
      }
    }
  }
  
  struct ThreeTab: View {
    var body: some View {
      Text("Contents1.3")
        .badge(3000)
        .tabItem {
          Image(systemName: "1.square.fill")
          Text("Tab3")
        }
    }
  }
  
  struct FourTab: View {
    var body: some View {
      Text("Contents1.4")
        .tabItem {
          Image(systemName: "1.square.fill")
          Text("Tab4")
        }
    }
  }
}

struct FourTabView_Previews: PreviewProvider {
    static var previews: some View {
        FourTabView()
    }
}
