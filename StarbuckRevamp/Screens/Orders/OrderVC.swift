//
//  OrderVC.swift
//  StarbuckRevamp
//
//  Created by Sao Sophea on 27/10/23.
//

import SwiftUI

struct OrderVC: View {
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
        
        ProductModel(name: "Veranda", image: "coffee1", isFavorite: false, ingredient: "Brewed Decaf Coffee", coffeeSizes: [
            CoffeeSize(size: "sz1", label: "Short", des: "8(fl oz)", image: ""),
            CoffeeSize(size: "sz2", label: "Tall", des: "12(fl oz)", image: ""),
            CoffeeSize(size: "sz3", label: "Grande", des: "16(fl oz)", image: ""),
            CoffeeSize(size: "sz4", label: "Venti", des: "20(fl oz)", image: "")
        ], addIns: "", flavors: "", price: "$2.78", location: "108th Ave Ne #140", ccal: 5),
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
                                    .customShadow(shadowRadius: 12)
                            }
                        }
                    }
                })
                .padding([.top], 10)
                
                ScrollView(.vertical, showsIndicators: false, content: {
                    
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
                                    NavigationLink(
                                        destination: ProductDetailVC(productData: item)
                                            .customHeader(backTitle: "Hot coffees")
                                        , label: {
                                            ProductItemView(item: item)
                                                .customShadow(shadowRadius: 14)
                                        }
                                    )
                                    .buttonStyle(PlainButtonStyle())
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
                                    NavigationLink(
                                        destination: ProductDetailVC(productData: item)
                                            .customHeader(backTitle: "Hot teas")
                                        , label: {
                                            ProductItemView(item: item)
                                                .customShadow(shadowRadius: 14)
                                        }
                                    )
                                    .buttonStyle(PlainButtonStyle())
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
                                    NavigationLink(
                                        destination: ProductDetailVC(productData: item)
                                            .customHeader(backTitle: "Hot drinks")
                                        , label: {
                                            ProductItemView(item: item)
                                                .customShadow(shadowRadius: 14)
                                        }
                                    )
                                    .buttonStyle(PlainButtonStyle())
                                }
                            }
                        })
                    }
                    .padding([.top], 20)
                })
                .padding([.top], 10)
            })
            .padding([.trailing, .leading], 18)
        })
        .onAppear(perform: {onFirstAppear()})
        .onTapGesture {
            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
        }
    }
}

struct OrderVC_Previews: PreviewProvider {
    static var previews: some View {
        OrderVC()
            .previewDevice("iPhone 13 Pro Max")
    }
}
