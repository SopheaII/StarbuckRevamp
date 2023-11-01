//
//  FloatHelper.swift
//  StarbuckRevamp
//
//  Created by Sao Sophea on 1/11/23.
//

import Foundation

class FloatHelper {
    
    static func formatFloatValue(_ value: Float) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.minimumFractionDigits = 2 // Minimum decimal places
        numberFormatter.maximumFractionDigits = 2 // Maximum decimal places

        if let formattedValue = numberFormatter.string(from: NSNumber(value: value)) {
            return formattedValue
        } else {
            return "\(value)"
        }
    }
}
