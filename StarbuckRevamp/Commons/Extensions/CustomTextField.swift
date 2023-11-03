//
//  CustomTextField.swift
//  StarbuckRevamp
//
//  Created by Sao Sophea on 3/11/23.
//

import SwiftUI

extension View {
    func customTextField() -> some View {
        self.background(
            Rectangle()
                .fill(Color.white)
                .cornerRadius(8)
                .shadow(
                    color: Color.gray.opacity(0.4),
                    radius: 4,
                    x: 0,
                    y: 0
                )
        )
        .customFont(.NunitoRegular(size: 15))
    }
}
