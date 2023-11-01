//
//  ProductItem.swift
//  StarbuckRevamp
//
//  Created by Sao Sophea on 27/10/23.
//

import SwiftUI

struct ProductItemView: View {
    var item: ProductModel
    
    var body: some View {
//        Button(action: {}) {
            ZStack(alignment: .top){
                VStack(alignment: .center, spacing: 0){
                    Image(item.image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 120,height: 120)
                    Text(item.name)
                        .customFont(.NunitoRegular(size: 17))
                        .lineLimit(2)
                        .multilineTextAlignment(.center)
                        .frame(alignment: .top)
                        .frame(height: 50)
                        .foregroundColor(.black)
                }
                Button(action:{}) {
                    Image(item.isFavorite ? Icons.icHeardFill.value : Icons.icHeard.value)
                        .resizable()
                        .frame(width: 28, height: 28)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        .offset(x: -10)
                }
            }
            .frame(width: 150 ,height: 200)
            .background(.white)
            .cornerRadius(14)
//        }
    }
}
