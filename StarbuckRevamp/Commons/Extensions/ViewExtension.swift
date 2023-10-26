//
//  ViewExtension.swift
//  starbucksRevamp
//
//  Created by Sao Sophea on 25/10/23.
//

import SwiftUI

extension View {
    func roundedCorner(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners) )
    }
}

struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

public enum AppFonts {
    case WorkSansSemiBold(size: CGFloat = 17)
    case WorkSansMedium(size: CGFloat = 17)
    case WorkSansBold(size: CGFloat = 17)
    case WorkSansRegular(size: CGFloat = 17)
    case WorkSansLight(size: CGFloat = 17)
    case NunitoBold(size: CGFloat = 17)
    case NunitoSemiBold(size: CGFloat = 17)
    case NunitoRegular(size: CGFloat = 17)
    case NunitoLight(size: CGFloat = 17)
    case NunitoExtraBold(size: CGFloat = 17)
    case NunitoMedium(size: CGFloat = 17)
    
    var rawValue: Font? {
        switch self {
        case .WorkSansSemiBold(let size):
            return Font.custom("WorkSans-SemiBold", size: size)
        case .WorkSansBold(let size):
            return Font.custom("WorkSans-Bold", size: size)
        case .WorkSansMedium(size: let size):
            return Font.custom("WorkSans-Medium", size: size)
        case .WorkSansRegular(size: let size):
            return Font.custom("WorkSans-Regular", size: size)
        case .WorkSansLight(size: let size):
            return Font.custom("WorkSans-Light", size: size)
        case .NunitoBold(size: let size):
            return Font.custom("Nunito-Bold", size: size)
        case .NunitoRegular(size: let size):
            return Font.custom("Nunito-Regular", size: size)
        case .NunitoSemiBold(size: let size):
            return Font.custom("Nunito-SemiBold", size: size)
        case .NunitoLight(size: let size):
            return Font.custom("Nunito-Light", size: size)
        case .NunitoExtraBold(size: let size):
            return Font.custom("Nunito-ExtraBold", size: size)
        case .NunitoMedium(size: let size):
            return Font.custom("Nunito-Medium", size: size)
        }
    }
}

extension View {
    func customFont(_ customFont: AppFonts) -> some View {
        self.font(customFont.rawValue)
    }
}
