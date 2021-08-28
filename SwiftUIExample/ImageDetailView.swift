//
//  ImageDetailView.swift
//  ImageDetailView
//
//  Created by Kotaro Fukuo on 2021/08/23.
//

import SwiftUI

struct ImageDetailView: View {
  @State private var isShowHalfSheet = false
  @State private var isShowTabPageView = false
  @State private var isShowFourTabView = false
  @State private var isShowLearnMoreView = false
  @State private var string = ""
  @State private var isLoading = false

  var body: some View {
    VStack(spacing: 30) {
      Text(string)
      NavigationLink {
        ImageMoreDetail(string: $string)
      } label: {
        Text("To More Detail")
      }
      Button(action: {
        isShowHalfSheet.toggle()
      }, label: {
        Text("Present Half sheet!")
      })
      Button(action: {
        isLoading.toggle()
      }, label: {
        Text("Start/Stop Loading Indicator")
      })
      Button(action: {
        isShowTabPageView.toggle()
      }) {
        Text("ShowTabPageView")
      }
      Button(action: {
        isShowFourTabView.toggle()
      }, label: {
        Text("FourTabView")
      })
      HStack {
        Spacer()
        if isLoading {
          ProgressView()
        } else {
          EmptyView()
        }
        Spacer()
      }
      .background(Color.teal)
    }
    .sheet(isPresented: $isShowTabPageView, content: {
      TabPageView(isShowTabPageView: $isShowTabPageView)
        .interactiveDismissDisabled(true)
    })
    .sheet(isPresented: $isShowFourTabView, content: {
      FourTabView()
    })
    .halfSheet(showHalfSheet: $isShowHalfSheet) {
      ZStack {
        Color.gray
        VStack {
          Text("This is half sheet")
            .font(.title.bold())
            .foregroundColor(.white)
            .padding(40)
          Divider()
            .background(.white)
          HStack {
            Spacer()
            Button(action: {}, label: {
              Text("Share")
                .padding(30)
            })
              .background(Color.white)
              .cornerRadius(10)
              .frame(width: 45, height: 45)
              .padding()
            Spacer()
            Button(action: {}, label: {
              Text("Link")
                .padding(30)
            })
              .background(Color.white)
              .cornerRadius(10)
              .frame(width: 45, height: 45)
              .padding()
            Spacer()
            Button(action: {}, label: {
              Text("Report")
                .padding(30)
            })
              .background(Color.white)
              .cornerRadius(10)
              .frame(width: 45, height: 45)
              .padding()
            Spacer()
          }
          Divider()
            .background(.white)
          HStack {
            Text("Title")
              .font(.title)
              .padding(.leading, 20)
            Spacer()
          }
          Text("hogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehogehoge")
            .padding([.leading, .trailing], 20)
          Divider()
            .background(.white)
          Button(action: {
            isShowLearnMoreView.toggle()
          }, label: {
            Spacer()
            Text("Lean More")
              .foregroundColor(Color.white)
            Spacer()
          })
            .frame(height: 45)
            .background(Color.blue)
            .cornerRadius(10)
            .padding(20)
            .sheet(isPresented: $isShowLearnMoreView) {
              LeanMoreView()
            }
          Spacer()
        }
      }
      .ignoresSafeArea()
    }
  }
}

struct ImageDetailView_Previews: PreviewProvider {
  static var previews: some View {
    ImageDetailView()
  }
}

extension View {
  func halfSheet<SheetView: View>(showHalfSheet: Binding<Bool>, @ViewBuilder sheetView: @escaping () -> SheetView) -> some View {
    return self
      .background(HalfSheetHelper(sheetView: sheetView(), showHalfSheet: showHalfSheet))
  }
}

struct HalfSheetHelper<SheetView: View>: UIViewControllerRepresentable {
  var sheetView: SheetView
  let viewController = UIViewController()
  @Binding var showHalfSheet: Bool
  
  func makeUIViewController(context: Context) -> some UIViewController {
    viewController.view.backgroundColor = .clear
    return viewController
  }
  
  func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
    if showHalfSheet {
      let sheetController = CustomHostingController(rootView: sheetView)
      uiViewController.present(sheetController, animated: true) {
        DispatchQueue.main.async {
          showHalfSheet.toggle()
        }
      }
    }
  }
}


final class CustomHostingController<Content: View>: UIHostingController<Content> {
  override func viewDidLoad() {
    super.viewDidLoad()
    if let presentationController = presentationController as? UISheetPresentationController {
      presentationController.detents = [
        .medium(),
        .large()
      ]
      
      presentationController.prefersGrabberVisible = true
    }
  }
}
