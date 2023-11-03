//
//  StoreUtils.swift
//  StarbuckRevamp
//
//  Created by Sao Sophea on 2/11/23.
//

import Foundation

class AppState: NSObject, ObservableObject {
    @Published var isPopToRoot: Bool = false
    @Published var navBarselected = 0
}
