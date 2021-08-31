//
//  RowDetailView.swift
//  RowDetailView
//
//  Created by Kotaro Fukuo on 2021/08/22.
//

import SwiftUI

struct RowDetailView: View {
  @State private var selectedSegmentedType: SegmentedType = .red
  
  enum SegmentedType: CaseIterable {
    case red
    case green
    case blue
    
    var title: String {
      switch self {
      case .red: return "Red"
      case .green: return "Green"
      case .blue: return "Blue"
      }
    }
  }
  
  var body: some View {
    VStack {
      Picker("Hoge", selection: $selectedSegmentedType) {
        ForEach(SegmentedType.allCases, id: \.self) {
          Text($0.title)
        }
      }
      .pickerStyle(SegmentedPickerStyle())
      SegmentedView(segmentedType: $selectedSegmentedType)
    }
  }
}

private extension RowDetailView {
  struct SegmentedView: View {
    @Binding var segmentedType: SegmentedType

    var body: some View {
      switch segmentedType {
      case .red:
        VStack {
          HStack {
            Spacer()
            Text("Red")
            Spacer()
          }
          Spacer()
        }.background(.red)
      case .green:
        VStack {
          HStack {
            Spacer()
            Text("Green")
            Spacer()
          }
          Spacer()
        }.background(.green)
      case .blue:
        VStack {
          HStack {
            Spacer()
            Text("Blue")
            Spacer()
          }
          Spacer()
        }.background(.blue)
      }
    }
  }
}

struct RowDetailView_Previews: PreviewProvider {
  static var previews: some View {
    RowDetailView()
  }
}
