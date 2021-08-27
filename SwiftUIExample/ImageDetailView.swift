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
    .halfSheet(showHalfSheet: $isShowHalfSheet) {
      ZStack {
        Color.gray
        VStack {
          Text("This is half sheet")
            .font(.title.bold())
            .padding()
          Divider()
            .background(.white)
          HStack {
            Button(action: {}, label: {
              Text("Share")
            })
              .background(Color.white)
              .cornerRadius(10)
              .frame(width: 45, height: 45)
              .padding()
            Spacer()
            Button(action: {}, label: {
              Text("Link")
            })
              .background(Color.white)
              .cornerRadius(10)
              .frame(width: 45, height: 45)
              .padding()
            Spacer()
            Button(action: {}, label: {
              Text("Report")
            })
              .background(Color.white)
              .cornerRadius(10)
              .frame(width: 45, height: 45)
              .padding()
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
