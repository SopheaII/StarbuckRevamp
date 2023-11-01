//
//  OrderVC.swift
//  StarbuckRevamp
//
//  Created by Sao Sophea on 27/10/23.
//

import SwiftUI

struct OrderVC: View {
    let productData = [
        ProductModel(name: "Veranda blend", image: "coffee2", isFavorite: true),
        ProductModel(name: "Everything & Cheddar Bagel", image: "coffee1", isFavorite: false),
        ProductModel(name: "Veranda", image: "coffee2", isFavorite: false)
    ]
    
    let shopData = [
        ShopModel(street: "108th Ave Ne #140", image: "coffeeShop1", shopTime: "7AM - 6AM", status: "Open now"),
        ShopModel(street: "409th Gle #340", image: "coffeeShop1", shopTime: "7PM - 6AM", status: "Open now")
    ]
    
    let productCategory = [
        ProductCategoryModel(name: "Drinks", id: 1),
        ProductCategoryModel(name: "Food", id: 2),
        ProductCategoryModel(name: "Merchandise", id: 3),
        ProductCategoryModel(name: "Fruid", id: 4),
        ProductCategoryModel(name: "Drinks", id: 5),
        ProductCategoryModel(name: "Food", id: 6),
    ]
    
    @State var searchText = ""
    @State var cgIdSelected = 0
    func onFirstAppear() {
        cgIdSelected = productCategory.first!.id
    }
    
    var body: some View {
        ZStack(alignment: .top, content: {
            Colors.appBg.value.ignoresSafeArea()
            
            VStack(alignment: .leading, spacing: 0, content: {
                
                // MARK: Header
                HStack(){
                    Text("Order")
                        .customFont(.NunitoExtraBold(size: 28))
                    Spacer()
                    Image(Icons.icLocation.value)
                        .resizable()
                        .frame(width: 18, height: 18)
                    Button(action: {}) {
                        Text("Choose the store")
                            .underline()
                            .baselineOffset(4)
                            .customFont(.NunitoMedium(size: 16))
                            .foregroundColor(Colors.softGray5.value)
                    }
                }
                
                ScrollView(.vertical, showsIndicators: false, content: {
                    // MARK: Search
                    HStack(spacing: 15) {
                        HStack(spacing: 5) {
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(Colors.softGray5.value)
                            TextField("Search", text: $searchText)
                            Button(action: {}) {
                                Image(systemName: "mic.fill")
                                    .foregroundColor(Colors.softGray5.value)
                            }
                        }
                        .padding(8)
                        .background(.white)
                        .cornerRadius(12)
                        Button(action: {}) {
                            ZStack{
                                Color.white
                                    .frame(width: 40, height: 40)
                                    .cornerRadius(10)
                                    .padding(2)
                                    .background(Colors.mainColor.value)
                                    .cornerRadius(12)
                                Image(Icons.icFilter.value)
                                    .resizable()
                                    .frame(width: 25, height: 25)
                                    .padding(4)
                            }
                        }
                    }
                    .padding([.top], 25)
                    
                    // MARK: Category
                    ScrollView(.horizontal, showsIndicators: false, content: {
                        HStack(spacing: 7) {
                            ForEach(productCategory, id: \.self){ item in
                                Button(action: {cgIdSelected = item.id}) {
                                    Text(item.name)
                                        .customFont(.NunitoRegular(size: 17))
                                        .padding(15)
                                        .frame(height: 45)
                                        .background(cgIdSelected == item.id ? Colors.softBlueBg.value : Color.white)
                                        .foregroundColor(cgIdSelected == item.id ? Colors.mainColor.value : Color.black)
                                        .cornerRadius(12)
                                }
                            }
                        }
                    })
                    .padding([.top], 10)
                    
                    // MARK: Hot coffees
                    VStack(spacing: 20) {
                        HStack{
                            Text("Hot coffees")
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
                    
                    // MARK: Hot teas
                    VStack(spacing: 20) {
                        HStack{
                            Text("Hot teas")
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
                    
                    // MARK: Hot drinks
                    VStack(spacing: 20) {
                        HStack{
                            Text("Hot drinks")
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
                })
            })
            .padding([.trailing, .leading], 18)
        })
        .onAppear(perform: {onFirstAppear()})
    }
}

struct OrderVC_Previews: PreviewProvider {
    static var previews: some View {
        OrderVC()
            .previewDevice("iPhone 13 Pro Max")
    }
}