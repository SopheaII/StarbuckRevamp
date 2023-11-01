//
//  BasketItem.swift
//  StarbuckRevamp
//
//  Created by Sao Sophea on 1/11/23.
//

import SwiftUI

struct BasketItem: View {
    let index: Int
    var presenter: BasketItemPresenter
    var productData: BasketModel? = .init(quantities: 0)
    
    init(index: Int, presenter: BasketItemPresenter, item: BasketModel) {
        self.index = index
        self.presenter = presenter
        self.productData = item
    }
    
    var body: some View {
        HStack(alignment: .top, spacing: 2) {
            Image(productData?.product.image ?? "")
                .resizable()
                .scaledToFit()
                .frame(width: 80, height: 80)
            VStack(alignment: .leading, spacing: 2) {
                Text(productData?.product.name ?? "")
                    .customFont(.NunitoSemiBold(size: 17))
                    .lineLimit(1)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.black)
                Text(productData?.product.price ?? "")
                    .customFont(.NunitoMedium(size: 14))
                    .foregroundColor(Colors.softGray4.value)
                
                HStack() {
                    Text(productData?.product.price ?? "")
                        .customFont(.NunitoBold(size: 18))
                        .foregroundColor(Colors.mainColor.value)
                        .padding([.top], 10)
                    Spacer()
                    HStack(){
                        Button(action: {
                            if productData?.quantities != 0 {
                                presenter.updateQuantityCb?(index, (productData?.quantities ?? 0) - 1)
                            }
                        }) {
                            Image(systemName: "arrow.backward.circle")
                                .resizable()
                                .frame(width: 25, height: 25)
                                .foregroundColor(Colors.softGray5.value)
                                .padding(10)
                        }
                        Text("\(productData?.quantities ?? 0)")
                            .customFont(.NunitoRegular(size: 17))
                            .foregroundColor(.black)
                        Button(action: { 
                            presenter.updateQuantityCb?(index, (productData?.quantities ?? 0) + 1)
                        }) {
                            Image(systemName: "arrow.forward.circle")
                                .resizable()
                                .frame(width: 25, height: 25)
                                .foregroundColor(Colors.softGray5.value)
                                .padding(10)
                        }
                    }
                }
            }
            Spacer()
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .frame(height: 110)
        .background(.white)
        .cornerRadius(14)
    }
}

#Preview {
    BasketItem(index: 1, presenter: BasketItemPresenter(), item: BasketModel(product: ProductModel(name: "Veranda blend", image: "coffee1", isFavorite: true, ingredient: "Brewed Decaf Coffee", coffeeSizes: [
        CoffeeSize(size: "sz2", label: "Short", des: "8(fl oz)", image: ""),
        CoffeeSize(size: "sz3", label: "Tall", des: "12(fl oz)", image: ""),
        CoffeeSize(size: "sz4", label: "Grande", des: "16(fl oz)", image: ""),
        CoffeeSize(size: "sz5", label: "Venti", des: "20(fl oz)", image: "")
    ], addIns: "", flavors: "", price: "$1.78", location: "108th Ave Ne #140", ccal: 5), quantities: 1))
}
