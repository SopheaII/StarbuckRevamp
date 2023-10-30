//
//  StarViewModel.swift
//  StarbuckRevamp
//
//  Created by Sao Sophea on 27/10/23.
//

import Foundation

enum Category: String, CaseIterable, Identifiable {
    case payWithStar
    case scanToEarn
    
    var id: String { self.rawValue }
}
