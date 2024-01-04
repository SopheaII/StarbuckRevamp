//
//  HomeVC.swift
//  starbucksRevamp
//
//  Created by Sao Sophea on 25/10/23.
//

import SwiftUI

struct HomeVC: View {
    @State private var isGiftDrag = false
    @State private var animate = false
    @State private var selectedProduct: ProductModel = ProductModel(name: "", image: "", isFavorite: false)
    @State private var isDetailViewActive: Bool = false
    
    let productData = [
        ProductModel(name: "Veranda blend", image: "coffee1", isFavorite: true, ingredient: "Brewed Decaf Coffee", coffeeSizes: [
            CoffeeSize(size: "sz1", label: "Short", des: "8(fl oz)", image: ""),
            CoffeeSize(size: "sz2", label: "Tall", des: "12(fl oz)", image: ""),
            CoffeeSize(size: "sz3", label: "Grande", des: "16(fl oz)", image: ""),
            CoffeeSize(size: "sz4", label: "Venti", des: "20(fl oz)", image: "")
        ], addIns: "", flavors: "", price: "$1.78", location: "108th Ave Ne #140", ccal: 5),
        
        ProductModel(name: "Everything & Cheddar Bagel", image: "coffee2", isFavorite: false, ingredient: "Brewed Decaf Coffee", coffeeSizes: [
            CoffeeSize(size: "sz1", label: "Short", des: "8(fl oz)", image: ""),
            CoffeeSize(size: "sz2", label: "Tall", des: "12(fl oz)", image: ""),
            CoffeeSize(size: "sz3", label: "Grande", des: "16(fl oz)", image: ""),
            CoffeeSize(size: "sz4", label: "Venti", des: "20(fl oz)", image: "")
        ], addIns: "", flavors: "", price: "$3.78", location: "108th Ave Ne #140", ccal: 5),
        ProductModel(name: "Everything & Cheddar Bagel", image: "coffee2", isFavorite: false, ingredient: "Brewed Decaf Coffee", coffeeSizes: [
            CoffeeSize(size: "sz1", label: "Short", des: "8(fl oz)", image: ""),
            CoffeeSize(size: "sz2", label: "Tall", des: "12(fl oz)", image: ""),
            CoffeeSize(size: "sz3", label: "Grande", des: "16(fl oz)", image: ""),
            CoffeeSize(size: "sz4", label: "Venti", des: "20(fl oz)", image: "")
        ], addIns: "", flavors: "", price: "$3.78", location: "108th Ave Ne #140", ccal: 5),
    ]
    
    let shopData = [
        ShopModel(street: "108th Ave Ne #140", image: "coffeeShop1", shopTime: "7AM - 6AM", status: "Open now"),
        ShopModel(street: "409th Gle #340", image: "coffeeShop1", shopTime: "7PM - 6AM", status: "Open now")
    ]
    let giftData = [
        GiftModel(id: 1, title: "", imageURL: Icons.giftImage.value),
        GiftModel(id: 2, title: "", imageURL: Icons.giftImage.value),
        GiftModel(id: 3, title: "", imageURL: Icons.giftImage.value),
        GiftModel(id: 4, title: "", imageURL: Icons.giftImage.value)
    ]
    
    var rightBarItemView: some View {
        return HStack(alignment: .center, spacing: 2) {
            Image(Icons.icLocation.value)
                .resizable()
                .frame(width: 16, height: 16)
            Button(action: {}) {
                Text("Choose the store")
                    .underline()
                    .baselineOffset(4)
                    .customFont(.NunitoMedium(size: 15))
                    .foregroundColor(Colors.softGray5.value)
            }
        }
    }
    
    var body: some View {
        ZStack(alignment: .top, content: {
            Colors.appBg.value.ignoresSafeArea()
            ParticleSystem()
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
//                Image(systemName: animate ? "checkmark.circle" : "touchid")
//                    .font(.system(size: 100))
//                    .symbolRenderingMode(.palette)
//                    .symbolEffect(.bounce, value: animate)
//                    .contentTransition(.symbolEffect(.replace))
//                    .foregroundStyle(.purple, .gray)
//                    .onTapGesture {
//                        animate.toggle()
//                    }
                
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
                                    .padding(2.5)
                                    .customShadow(shadowRadius: 10)
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
                                    .padding(2.5)
                                    .customShadow(shadowRadius: 10)
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
                            ScrollViewReader { scrollViewProxy in
                                HStack(spacing: 15) {
                                    ForEach(giftData.indices, id: \.self) {index in
                                        NavigationLink(
                                            destination: GiftVC().customHeader(backTitle: "Home", title: "Gift cards")
                                            , label: {
                                                Image(giftData[index].imageURL)
                                                    .resizable()
                                                    .frame(width: 280, height: 200)
                                                    .scaledToFit()
                                                    .cornerRadius(15)
                                                    .customShadow(shadowRadius: 15)
                                                    .scaleEffect(isGiftDrag ? 0.94 : 1)
                                            }
                                        )
                                        .buttonStyle(PlainButtonStyle())
                                        .id(index)
                                    }
                                }
                                .background {
                                    ScrollDetector { offset in
                                    } onDraggingEnd: { offset, velocity in
                                        let scrollId = Int(round(abs(offset)/287.5))
                                        withAnimation {
                                            isGiftDrag = false
                                            scrollViewProxy.scrollTo(scrollId)
                                        }
                                    } onDragBenin: {
                                        withAnimation{
                                            isGiftDrag = true
                                        }
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
                                    Button(action: {
                                        selectedProduct = item
                                        isDetailViewActive = true
                                    }) {
                                        ProductItemView(item: item)
                                            .customShadow(shadowRadius: 14)
                                    }
                                    .buttonStyle(PlainButtonStyle())
                                }
                            }
                            .navigationDestination(isPresented: $isDetailViewActive, destination: {
                                ProductDetailVC(productData: selectedProduct)
                                    .customHeader(backTitle: "Current coffees", rightView: rightBarItemView)
                            })
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
                                        .customShadow(shadowRadius: 12)
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
