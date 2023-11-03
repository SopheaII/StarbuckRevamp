//
//  CoffeeShopViewf.swift
//  StarbuckRevamp
//
//  Created by Sao Sophea on 27/10/23.
//

import SwiftUI

struct CoffeeShopView: View {
    var item: ShopModel
    
    // Navigate state
    @State var isNavigateToShopDetail = false
    
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
                    Button(action: {isNavigateToShopDetail = true}) {
                        Text("Check out")
                            .customFont(.NunitoMedium(size: 15))
                            .padding(5)
                            .foregroundColor(.white)
                            .background(Colors.mainColor.value)
                            .cornerRadius(5)
                    }
                    .navigationDestination(isPresented: $isNavigateToShopDetail, destination: {
                        CoffeeShopDetailVC()
                            .customHeader(backTitle: "Gift cards", title: "Birthday card")
                    })
                }
            }
        }
        .padding(10)
        .background(.white)
        .cornerRadius(12)
    }
}
