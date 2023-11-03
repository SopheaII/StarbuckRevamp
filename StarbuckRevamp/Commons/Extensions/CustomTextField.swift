//
//  CustomTextField.swift
//  StarbuckRevamp
//
//  Created by Sao Sophea on 3/11/23.
//

import SwiftUI

extension View {
    func customShadow(shadowRadius: CGFloat = 8) -> some View {
        self
            .background(
                Rectangle()
                    .fill(Color.white)
                    .cornerRadius(shadowRadius)
                    .shadow(
                        color: Color.gray.opacity(0.2),
                        radius: 3,
                        x: 0,
                        y: 0
                    )
                    .padding(2)
            )
    }
}
