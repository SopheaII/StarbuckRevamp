//
//  VisibilityNavBarExtension.swift
//  StarbuckRevamp
//
//  Created by Sao Sophea on 31/10/23.
//

import SwiftUI

extension UIView {
      
      func allSubviews() -> [UIView] {
          var res = self.subviews
          for subview in self.subviews {
              let riz = subview.allSubviews()
              res.append(contentsOf: riz)
          }
          return res
      }
  }
  
  struct Tool {
      static func showTabBar() {
//          UIApplication.shared.windows.first(where: { $0.isKeyWindow })?.allSubviews().forEach({ (v) in
//              if let view = v as? UITabBar {
//                  view.isHidden = false
//              }
//          })
          UITabBar.appearance().isHidden = false
      }
      
      static func hiddenTabBar() {
//          UIApplication.shared.windows.first(where: { $0.isKeyWindow })?.allSubviews().forEach({ (v) in
//              if let view = v as? UITabBar {
//                  view.isHidden = true
//              }
//          })
          UITabBar.appearance().isHidden = true
      }
  }
  
  struct ShowTabBar: ViewModifier {
      func body(content: Content) -> some View {
          return content.padding(.zero).onAppear {
              Tool.showTabBar()
          }
      }
  }
  struct HiddenTabBar: ViewModifier {
      func body(content: Content) -> some View {
          return content.padding(.zero).onAppear {
              Tool.hiddenTabBar()
          }
      }
  }
  
  extension View {
      func showTabBar() -> some View {
          return self.modifier(ShowTabBar())
      }
      func hiddenTabBar() -> some View {
          return self.modifier(HiddenTabBar())
      }
  }

