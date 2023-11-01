//
//  ScaleViewStyle.swift
//  StarbuckRevamp
//
//  Created by Sao Sophea on 1/11/23.
//

import SwiftUI

struct ScaleButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 2 : 1)
    }
}
