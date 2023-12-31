//
//  Colors.swift
//  starbucksRevamp
//
//  Created by Sao Sophea on 25/10/23.
//

import SwiftUI

enum Colors {
    case mainColor
    case softGray3
    case softGray4
    case appBg
    case softGray5
    case softBlue2
    case softBlueBg
    case gold
    
    var value: Color {
        var colorValue: Color
        
        switch self {
        case .mainColor:
            colorValue = Color("primaryColor")
        case .softGray3:
            colorValue = Color("softGray3")
        case .softGray4:
            colorValue = Color("softGray4")
        case .appBg:
            colorValue = Color("appBg")
        case .softGray5:
            colorValue = Color("softGray5")
        case .softBlue2:
            colorValue = Color("softBlue2")
        case .softBlueBg:
            colorValue = Color("softBlueBg")
        case .gold:
            colorValue = Color("gold")
        }
        return colorValue
    }
}
