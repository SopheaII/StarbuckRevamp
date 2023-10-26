//
//  Colors.swift
//  starbucksRevamp
//
//  Created by Sao Sophea on 25/10/23.
//

import SwiftUI

enum Colors {
    case mainColor
    
    var value: Color {
        var colorValue: Color
        
        switch self {
        case .mainColor:
            colorValue = Color("primaryColor")
        }
        return colorValue
    }
}
