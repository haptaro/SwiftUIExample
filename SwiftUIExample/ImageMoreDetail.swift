//
//  ImageMoreDetail.swift
//  ImageMoreDetail
//
//  Created by Kotaro Fukuo on 2021/08/23.
//

import SwiftUI

struct ImageMoreDetail: View {
  @Binding var string: String
  @State private var showSheet = false

  var body: some View {
    ScrollView(showsIndicators: false) {
      VStack {
        Text("Hello, World!")
        TextField(
          "Placeholder",
          text: $string
        )
          .textFieldStyle(.roundedBorder)
          .font(.title3)
          .padding([.top, .leading, .trailing], 30)
        InputTextFromSheet()
        VStack {
          HStack {
            Text("Left side")
            Spacer()
          }
          Text("Center")
          HStack {
            Spacer()
            Text("Right side")
          }
        }
        .padding()
        Description()
      }
    }
  }
}

private extension ImageMoreDetail {

  struct InputTextFromSheet: View {
    @State private var inputText = ""
    @State private var showInputSheet = false

    var body: some View {
      VStack(spacing: 30) {
        Text("Input from sheet is \(inputText)")
        Button(action: {
          showInputSheet.toggle()
        }, label: {
          Text("Open sheet")
        })
          .sheet(isPresented: $showInputSheet) {
            TextField("Placeholder", text: $inputText)
              .textFieldStyle(.roundedBorder)
              .interactiveDismissDisabled(inputText.isEmpty)
          }
      }
      .padding(30)
      .background(Color.gray)
      .cornerRadius(25)
    }
  }
  
  struct Description: View {
    var body: some View {
      VStack() {
        HStack {
          Text("Introduce")
            .font(.title)
          Spacer()
        }.padding()
        Divider()
          .background(.gray)
          .padding()
        Text("hogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehoge")
          .padding()
        HStack {
          Spacer()
          Text("Created by foo")
            .font(.caption)
            .foregroundColor(Color.gray)
        }
        .padding()
      }
      .padding()
    }
  }
}

struct ImageMoreDetail_Previews: PreviewProvider {
  static var previews: some View {
    ImageMoreDetail(string: .constant("Hello, World!"))
  }
}
