//
//  BasketModel.swift
//  StarbuckRevamp
//
//  Created by Sao Sophea on 30/10/23.
//

import Foundation

struct BasketModel: Equatable, Hashable {
    let product: ProductModel
    var quantities: Int
    
    init(product: ProductModel = ProductModel(name: "", image: "", isFavorite: false), quantities: Int) {
        self.product = product
        self.quantities = quantities
    }
}
