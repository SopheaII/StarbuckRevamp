//
//  ProductDetailVC.swift
//  StarbuckRevamp
//
//  Created by Sao Sophea on 31/10/23.
//

import SwiftUI

struct ProductDetailVC: View {
    var productData: ProductModel
    @State var searchText = ""
    @State var cfSizeSelected = 0
    
    var body: some View {
        ZStack(alignment: .top, content: {
            Colors.appBg.value.ignoresSafeArea()
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .leading, spacing: 0) {
                    // MARK: Header
                    ZStack(alignment: .top) {
                        Image(productData.image)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 150)
                        Button(action:{}) {
                            Image(productData.isFavorite ? Icons.icHeardFill.value : Icons.icHeard.value)
                                .resizable()
                                .frame(width: 30, height: 30)
                                .frame(maxWidth: .infinity, alignment: .topTrailing)
                                .offset(x: -25, y: 15)
                        }
                        
                        Text(productData.name)
                            .customFont(.NunitoBold(size: 18))
                            .lineLimit(1)
                            .multilineTextAlignment(.center)
                            .frame(height: 50)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomLeading)
                            .offset(x: 20)
                    }
                    .frame(maxWidth: .infinity)
                    .frame(height: 200)
                    .background(Colors.mainColor.value)
                    .cornerRadius(12)
                    
                    // MARK: Ingrediencts
                    Text(productData.name)
                        .customFont(.NunitoBold(size: 17))
                        .lineLimit(1)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.black)
                        .padding([.top], 20)
                    
                    Text(productData.ingredient)
                        .customFont(.NunitoRegular(size: 17))
                        .lineLimit(1)
                        .multilineTextAlignment(.center)
                        .foregroundColor(Colors.softGray5.value)
                        .padding([.top], 8)
                    
                    // MARK: Coffee size
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack() {
                            ForEach(productData.coffeeSizes, id: \.self){ item in
                                Image(item.image)
                            }
                        }
                    }
                }
            }
            .padding([.top], 10)
            .padding([.trailing, .leading], 18)
        })
    }
}

#Preview {
    ProductDetailVC(productData: ProductModel(name: "Veranda blend", image: "coffee1", isFavorite: true, ingredient: "Brewed Decaf Coffee", coffeeSizes: [
        CoffeeSize(size: "sz2", label: "Short", des: "8(fl oz)", image: ""),
        CoffeeSize(size: "sz3", label: "Tall", des: "12(fl oz)", image: ""),
        CoffeeSize(size: "sz4", label: "Grande", des: "16(fl oz)", image: ""),
        CoffeeSize(size: "sz5", label: "Venti", des: "20(fl oz)", image: "")
    ], addIns: "", flavors: "", price: "1.78", location: "108th Ave Ne 140"))
}
