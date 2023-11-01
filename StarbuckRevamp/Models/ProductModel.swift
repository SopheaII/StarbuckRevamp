//
//  ProductModel.swift
//  StarbuckRevamp
//
//  Created by Sao Sophea on 26/10/23.
//

import Foundation

struct ProductModel: Equatable, Hashable  {
    let name: String
    let image: String
    var isFavorite: Bool
    let ingredient: String
    let coffeeSizes: [CoffeeSize]
    var addIns: String
    var flavors: String
    var price: String
    let location: String
    let ccal: Float
    
    init(
        name: String,
        image: String,
        isFavorite: Bool,
        ingredient: String = "",
        coffeeSizes: [CoffeeSize] = [],
        addIns: String = "",
        flavors: String = "",
        price: String = "$0.00",
        location: String = "",
        ccal: Float = 0.0
    ) {
        self.name = name
        self.image = image
        self.isFavorite = isFavorite
        self.ingredient = ingredient
        self.coffeeSizes = coffeeSizes
        self.addIns = addIns
        self.flavors = flavors
        self.price = price
        self.location = location
        self.ccal = ccal
    }
}

struct CoffeeSize: Equatable, Hashable {
    let size: String
    let label: String
    let des: String
    let image: String
}
