//
//  BasketVC.swift
//  StarbuckRevamp
//
//  Created by Sao Sophea on 30/10/23.
//

import SwiftUI

struct BasketVC: View {
    @State var productData = [
        BasketModel(product: ProductModel(name: "Veranda blend", image: "coffee2", isFavorite: false, price: "$2.05", location: "108th Ave Ne #140"), quantities: 1),
        BasketModel(product: ProductModel(name: "Everything & Cheddar Bagel", image: "coffee1", isFavorite: false, price: "$$3.05", location: "409th Gle #340"), quantities: 1),
        BasketModel(product: ProductModel(name: "Veranda", image: "coffee2", isFavorite: false, price: "$2.05", location: "108th Ave Ne #140"), quantities: 1),
    ]
    
    func onFirstAppear() {
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
                            Button(action: {}) {
                                HStack(alignment: .top, spacing: 2) {
                                    Image(item.product.image)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 80, height: 80)
                                    VStack(alignment: .leading, spacing: 2) {
                                        Text(item.product.name)
                                            .customFont(.NunitoSemiBold(size: 17))
                                            .lineLimit(1)
                                            .multilineTextAlignment(.center)
                                            .foregroundColor(.black)
                                        Text(item.product.price)
                                            .customFont(.NunitoMedium(size: 14))
                                            .foregroundColor(Colors.softGray4.value)
                                        
                                        HStack() {
                                            Text(item.product.price)
                                                .customFont(.NunitoBold(size: 18))
                                                .foregroundColor(Colors.mainColor.value)
                                                .padding([.top], 10)
                                            Spacer()
                                            HStack(){
                                                Button(action: {
                                                    if item.quantities != 0 {
                                                        updateQuantity(index: index, quantity: item.quantities - 1)
                                                    }
                                                }) {
                                                    Image(systemName: "arrow.backward.circle")
                                                        .resizable()
                                                        .frame(width: 25, height: 25)
                                                        .foregroundColor(Colors.softGray5.value)
                                                        .padding(10)
                                                }
                                                Text("\(item.quantities)")
                                                    .customFont(.NunitoRegular(size: 17))
                                                    .foregroundColor(.black)
                                                Button(action: {
                                                    updateQuantity(index: index, quantity: item.quantities + 1)
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
