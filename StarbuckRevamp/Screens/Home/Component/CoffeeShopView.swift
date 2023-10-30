//
//  CoffeeShopViewf.swift
//  StarbuckRevamp
//
//  Created by Sao Sophea on 27/10/23.
//

import SwiftUI

struct CoffeeShopView: View {
    var item: ShopModel
    
    var body: some View {
        HStack(alignment: .top, spacing: 8){
            Image(item.image)
                .resizable()
                .frame(width: 160,height: 100)
                .cornerRadius(15)
                .scaledToFill()
                .frame(maxWidth: .infinity, alignment: .leading)
            VStack(alignment: .leading, spacing: 8){
                Text(item.street)
                    .customFont(.NunitoRegular(size: 15))
                    .lineLimit(2)
                    .foregroundColor(.black)
                    .frame(maxWidth: .infinity, alignment: .leading)
                HStack(spacing: 0) {
                    Image(systemName: "clock")
                        .foregroundColor(Colors.softGray4.value)
                    Text(item.shopTime)
                        .customFont(.NunitoMedium(size: 14))
                        .foregroundColor(Colors.softGray4.value)
                    
                }
                HStack(spacing: 0) {
                    Text(item.status)
                        .customFont(.NunitoMedium(size: 14))
                        .foregroundColor(Colors.mainColor.value)
                    Spacer()
                    Button(action: {}) {
                        Text("Check out")
                            .customFont(.NunitoMedium(size: 15))
                            .padding(5)
                            .foregroundColor(.white)
                            .background(Colors.mainColor.value)
                            .cornerRadius(5)
                    }
                }
            }
        }
//                                    .frame(width: 320 ,height: 170, alignment: .top)
        .padding(10)
        .background(.white)
    }
}
