//
//  BasketVC.swift
//  StarbuckRevamp
//
//  Created by Sao Sophea on 30/10/23.
//

import SwiftUI

struct BasketVC: View {
    @State var productData = [
        BasketModel(product: ProductModel(name: "Veranda blend", image: "coffee1", isFavorite: true, ingredient: "Brewed Decaf Coffee", coffeeSizes: [
            CoffeeSize(size: "sz2", label: "Short", des: "8(fl oz)", image: ""),
            CoffeeSize(size: "sz3", label: "Tall", des: "12(fl oz)", image: ""),
            CoffeeSize(size: "sz4", label: "Grande", des: "16(fl oz)", image: ""),
            CoffeeSize(size: "sz5", label: "Venti", des: "20(fl oz)", image: "")
        ], addIns: "", flavors: "", price: "$1.78", location: "108th Ave Ne #140", ccal: 5), quantities: 1),
        BasketModel(product: ProductModel(name: "Everything & Cheddar Bagel", image: "coffee2", isFavorite: false, ingredient: "Brewed Decaf Coffee", coffeeSizes: [
            CoffeeSize(size: "sz2", label: "Short", des: "8(fl oz)", image: ""),
            CoffeeSize(size: "sz3", label: "Tall", des: "12(fl oz)", image: ""),
            CoffeeSize(size: "sz4", label: "Grande", des: "16(fl oz)", image: ""),
            CoffeeSize(size: "sz5", label: "Venti", des: "20(fl oz)", image: "")
        ], addIns: "", flavors: "", price: "$3.78", location: "108th Ave Ne #140", ccal: 5), quantities: 1),
        BasketModel(product: ProductModel(name: "Veranda", image: "coffee1", isFavorite: false, ingredient: "Brewed Decaf Coffee", coffeeSizes: [
            CoffeeSize(size: "sz2", label: "Short", des: "8(fl oz)", image: ""),
            CoffeeSize(size: "sz3", label: "Tall", des: "12(fl oz)", image: ""),
            CoffeeSize(size: "sz4", label: "Grande", des: "16(fl oz)", image: ""),
            CoffeeSize(size: "sz5", label: "Venti", des: "20(fl oz)", image: "")
        ], addIns: "", flavors: "", price: "$2.78", location: "108th Ave Ne #140", ccal: 5), quantities: 1),
    ]
    
    @StateObject var presenter =  BasketItemPresenter()
    
    init() {
    }
    
    func onFirstAppear() {
        self.presenter.updateQuantityCb = self.updateQuantity
    }
    
    func updateQuantity(index: Int, quantity: Int) {
        productData[index].quantities = quantity
    }
    
    var body: some View {
        ZStack(alignment: .top, content: {
            Colors.appBg.value.ignoresSafeArea()
            
            VStack(alignment: .leading, spacing: 0, content: {
                // MARK: Header
                Text("Basket")
                    .customFont(.NunitoExtraBold(size: 28))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(alignment: .leading) {
                        ForEach(Array(self.productData.enumerated()), id: \.offset) {index, item in
                            NavigationLink(
                                destination: ProductDetailVC(productData: item.product)
                                    .customHeader(backTitle: "Bakset")
                                , label: {
                                    BasketItem(index: index, presenter: presenter, item: item)
                                }
                            )
                            .buttonStyle(PlainButtonStyle())
                        }
                    }
                }
                .padding([.top], 15)
                
                Spacer()
                Button(action: {}) {
                    ZStack{
                        Text("Check out")
                            .customFont(.NunitoSemiBold(size: 17))
                            .foregroundStyle(.white)
                            .padding(12)
                            .frame(maxWidth: .infinity, alignment: .center)
                            .background(Colors.mainColor.value)
                            .cornerRadius(10)
                            .padding([.bottom], 20)
                    }
                }
            })
            .padding([.trailing, .leading], 18)
            
            
        })
        .onAppear(perform: {onFirstAppear()})
    }
}

#Preview {
    BasketVC()
}
