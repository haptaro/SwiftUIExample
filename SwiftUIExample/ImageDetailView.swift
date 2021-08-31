//
//  ImageDetailView.swift
//  ImageDetailView
//
//  Created by Kotaro Fukuo on 2021/08/23.
//

import SwiftUI

enum SheetKind: Identifiable {
  case halfSheet
  case tabPage
  case fourTab
  var id: Int {
    hashValue
  }
}

enum HalfSheetKind: Identifiable {
  case learnMore
  case share
  case link
  
  var id: Int {
    hashValue
  }
}

struct ImageDetailView: View {

  @State private var string = ""
  @State private var isLoading = false
  @State private var sheetKind: SheetKind? = nil
  @State private var halfSheetKind: HalfSheetKind? = nil

  var body: some View {
    VStack(spacing: 30) {
      Text(string)
      NavigationLink {
        ImageMoreDetail(string: $string)
      } label: {
        Text("To More Detail")
      }
      Button(action: {
        sheetKind = .halfSheet
      }, label: {
        Text("Present Half sheet!")
      })
      Button(action: {
        isLoading.toggle()
      }, label: {
        Text("Start/Stop Loading Indicator")
      })
      Button(action: {
        sheetKind = .tabPage
      }) {
        Text("ShowTabPageView")
      }
      Button(action: {
        sheetKind = .fourTab
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
    .sheet(item: $sheetKind) { kind in
      switch kind {
      case .fourTab:
        FourTabView()
      case .halfSheet:
        Text("")
          .hidden()
      case .tabPage:
        TabPageView(sheetKind: $sheetKind)
          .interactiveDismissDisabled(true)
      }
    }
    .halfSheet(sheetKind: $sheetKind) {
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
            Button(action: {
              halfSheetKind = .share
            }, label: {
              Text("Share")
            })
              .background(Color.white)
              .cornerRadius(10)
              .frame(width: 45, height: 45)
              .padding()
            Spacer()
            Button(action: {
              halfSheetKind = .link
            }, label: {
              Text("Link")
            })
              .background(Color.white)
              .cornerRadius(10)
              .frame(width: 45, height: 45)
              .padding()
            Spacer()
            Button(action: {
              
            }, label: {
              Text("Report")
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
            halfSheetKind = .learnMore
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
          Spacer()
        }
        .sheet(item: $halfSheetKind) { kind in
          switch kind {
          case .link:
            LinkView(sheetKind: $sheetKind)
          case .learnMore:
            LeanMoreView()
          case .share:
            ShareView()
          }
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

private extension ImageDetailView {
  struct LinkView: View {
    @Binding var sheetKind: SheetKind?

    var body: some View {
      VStack {
        Text("link")
        Button(action: {
          sheetKind = nil
        }) {
          Text("Close")
        }
      }
    }
  }
}

extension View {
  func halfSheet<SheetView: View>(sheetKind: Binding<SheetKind?>, @ViewBuilder sheetView: @escaping () -> SheetView) -> some View {
    return self
      .background(HalfSheetHelper(sheetView: sheetView(), sheetkind: sheetKind))
  }
}

struct HalfSheetHelper<SheetView: View>: UIViewControllerRepresentable {
  var sheetView: SheetView
  let viewController = UIViewController()
  @Binding var sheetkind: SheetKind?

  func makeUIViewController(context: Context) -> some UIViewController {
    viewController.view.backgroundColor = .clear
    return viewController
  }

  func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
    guard sheetkind == .halfSheet else {
      return
    }

    let sheetController = CustomHostingController(rootView: sheetView)
    uiViewController.present(sheetController, animated: true) {
      DispatchQueue.main.async {
        sheetkind = nil
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
