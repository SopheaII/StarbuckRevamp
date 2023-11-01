//
//  BackNavigate.swift
//  StarbuckRevamp
//
//  Created by Sao Sophea on 31/10/23.
//

import SwiftUI

struct BackNavigationModifier: ViewModifier {
    let backTitle: String
    let title: String
    let rightView: AnyView
    
    @Environment(\.presentationMode) var presentationMode
    func body(content: Content) -> some View {
        return content.padding(.zero)
            .navigationBarBackButtonHidden(true)
            .navigationBarTitle("", displayMode: .inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                    }) {
                        HStack() {
                            Image(Icons.icArrowBack.value)
                                .resizable()
                                .frame(width: 17, height: 17)
                            Text("\(backTitle)")
                                .customFont(.NunitoSemiBold(size: 17))
                                .foregroundColor(.black)
                        }
                    }
                }
                ToolbarItem(placement: .principal) {
                    Text("\(title)")
                        .customFont(.NunitoBold(size: 17))
                        .foregroundColor(.black)
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    rightView
                }
            }
    }
}

extension View {
    func customHeader(backTitle: String = "Back", title: String = "", rightView: some View = EmptyView()) -> some View {
        return self.modifier(BackNavigationModifier(backTitle: backTitle, title: title, rightView: AnyView(rightView)))
    }
}
