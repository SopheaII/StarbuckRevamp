//
//  BasketItemPresenter.swift
//  StarbuckRevamp
//
//  Created by Sao Sophea on 1/11/23.
//

import Foundation

class BasketItemPresenter: ObservableObject{
    var updateQuantityCb: ((_ index: Int, _ quantity: Int)-> ())?
}
