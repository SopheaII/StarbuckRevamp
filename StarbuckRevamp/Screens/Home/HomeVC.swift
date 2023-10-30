//
//  HomeVC.swift
//  starbucksRevamp
//
//  Created by Sao Sophea on 25/10/23.
//

import SwiftUI

struct HomeVC: View {
    let productData = [
        ProductModel(name: "Veranda blend", image: "coffee1", isFavorite: true),
        ProductModel(name: "Everything & Cheddar Bagel", image: "coffee2", isFavorite: false),
        ProductModel(name: "Veranda", image: "coffee1", isFavorite: false)
    ]
    let shopData = [
        ShopModel(street: "108th Ave Ne #140", image: "coffeeShop1", shopTime: "7AM - 6AM", status: "Open now"),
        ShopModel(street: "409th Gle #340", image: "coffeeShop1", shopTime: "7PM - 6AM", status: "Open now")
    ]
    
    var body: some View {
        ZStack(alignment: .top, content: {
            Colors.appBg.value.ignoresSafeArea()
            
            VStack(alignment: .leading, spacing: 0, content: {
                
                // MARK: Header
                HStack(){
                    Text("Hi, Bob!")
                        .customFont(.NunitoExtraBold(size: 28))
                    Button(action: {}) {
                        ZStack(alignment: .top){
                            Image(Icons.icBellGray.value)
                                .resizable()
                                .frame(width: 34, height: 37)
                            Spacer()
                                .frame(width: 10, height: 10)
                                .background(Colors.mainColor.value)
                                .cornerRadius(5)
                                .padding(2)
                                .background(.white)
                                .cornerRadius(6)
                                .offset(x: 9, y: 1)
                        }
                        .frame(maxWidth: .infinity, alignment: .trailing)
                    }
                }
                
                ScrollView(.vertical, showsIndicators: false, content: {
                    // MARK: Top banner
                    HStack(spacing: 15) {
                        VStack(alignment: .leading, spacing: 0) {
                            HStack(alignment: .top, spacing: 4){
                                Text("150")
                                    .customFont(.NunitoBold(size: 23))
                                Image(Icons.icStarGold.value)
                                    .resizable()
                                    .frame(width: 18, height: 18)
                                    .offset(y: 5)
                            }
                            Text("Stars earned")
                                .customFont(.NunitoRegular(size: 15))
                                .foregroundColor(Colors.softGray4.value)
                        }
                        Button(action:{}) {
                            ZStack{
                                Colors.mainColor.value
                                    .frame(width: 130, height: 50)
                                    .background(Colors.mainColor.value)
                                    .cornerRadius(10)
                                Text("Buy with stars")
                                    .customFont(.NunitoRegular(size: 16))
                                    .foregroundColor(.white)
                            }
                        }
                        Button(action: {}) {
                            ZStack{
                                Color.white
                                    .frame(width: 48, height: 48)
                                    .cornerRadius(8)
                                    .padding(2)
                                    .background(Colors.mainColor.value)
                                    .cornerRadius(10)
                                Image(Icons.icQR.value)
                                    .resizable()
                                    .frame(width: 36, height: 36)
                                    .padding(4)
                            }
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding([.top], 25)
                    
                    // MARK: Gift card
                    VStack() {
                        HStack{
                            Text("Gift cards")
                                .customFont(.NunitoBold(size: 17))
                            Spacer()
                            Button(action: {}) {
                                Text("View all")
                                    .customFont(.NunitoBold(size: 17))
                                    .foregroundColor(Colors.mainColor.value)
                            }
                        }
                        
                        ScrollView(.horizontal, showsIndicators: false, content: {
                            HStack(spacing: 15) {
                                ForEach(1...2, id: \.self) {_ in
                                    Button(action: {}) {
                                        Image(Icons.giftImage.value)
                                            .resizable()
                                            .scaledToFit()
                                            .frame(height: 200)
                                            .cornerRadius(15)
                                    }
                                }
                            }
                        })
                        .padding([.top], 10)
                    }
                    .padding([.top], 10)
                    
                    // MARK: Reccent order
                    VStack(spacing: 15) {
                        HStack{
                            Text("Current orders")
                                .customFont(.NunitoBold(size: 17))
                            Spacer()
                            Button(action: {}) {
                                Text("View all")
                                    .customFont(.NunitoBold(size: 17))
                                    .foregroundColor(Colors.mainColor.value)
                            }
                        }
                        
                        ScrollView(.horizontal, showsIndicators: false, content: {
                            HStack(spacing: 10) {
                                ForEach(productData, id: \.self) { item in
                                    ProductItemView(item: item)
                                }
                            }
                        })
                    }
                    .padding([.top], 20)
                    
                    // MARK: Coffee shop
                    VStack(spacing: 15) {
                        HStack{
                            Text("Coffee shops")
                                .customFont(.NunitoBold(size: 17))
                            Spacer()
                            Button(action: {}) {
                                Text("View all")
                                    .customFont(.NunitoBold(size: 17))
                                    .foregroundColor(Colors.mainColor.value)
                            }
                        }
                        
                        ScrollView(.horizontal, showsIndicators: false, content: {
                            HStack(spacing: 15) {
                                ForEach(shopData, id: \.self) { item in
                                    CoffeeShopView(item: item)
                                }
                            }
                        })
                    }
                    .padding([.top], 20)
                })
            })
            .padding([.trailing, .leading], 18)
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeVC()
            .previewDevice("iPhone 13 Pro Max")
    }
}
