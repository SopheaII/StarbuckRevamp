//
//  BasketModel.swift
//  StarbuckRevamp
//
//  Created by Sao Sophea on 30/10/23.
//

import Foundation

struct BasketModel: Equatable, Hashable {
    let product: ProductModel
    var price: String
    let location: String
    var quantities: Int
}
