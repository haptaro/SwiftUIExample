//
//  ImageDetailView.swift
//  ImageDetailView
//
//  Created by Kotaro Fukuo on 2021/08/23.
//

import SwiftUI

struct ImageDetailView: View {
  @State private var isShowHalfSheet = false
  @State private var string = ""
  
  var body: some View {
    VStack {
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
    }.halfSheet(showHalfSheet: $isShowHalfSheet) {
      ZStack {
        Color.gray
        Text("Hi! this is half sheet")
          .font(.title.bold())
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
