//
//  yourOrderVC.swift
//  StarbuckRevamp
//
//  Created by Sao Sophea on 2/11/23.
//

import SwiftUI

struct yourOrderVC: View {
    
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
    
    let recepientOption = [CommonModel(id: 1, title: "Myself"), CommonModel(id: 2, title: "Friend"), CommonModel(id: 3, title: "Sister")]
    let paymentOption = [CommonModel(id: 1, title: "By bonuses"), CommonModel(id: 2, title: "By wallet"), CommonModel(id: 3, title: "In store")]
    let shopData = [
        ShopModel(street: "108th Ave Ne #140", image: "coffeeShop1", shopTime: "7AM - 6AM", status: "Open now"),
        ShopModel(street: "409th Gle #340", image: "coffeeShop1", shopTime: "7PM - 6AM", status: "Open now")
    ]
    
    @State var currentRecepientOption = ""
    @State var isExpandRecepientOption = false
    @State var hourField = ""
    @State var minuteField = ""
    @State var timeSegmentIndex = 0
    @State var paymentSelected = -1
    
    func firstAppear() {
        currentRecepientOption = recepientOption.first?.title ?? ""
    }
    
    var body: some View {
        ZStack(alignment: .top, content: {
            Colors.appBg.value.ignoresSafeArea()
            VStack(){
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(alignment: .leading, spacing: 15, content: {
                        // MARK: Header
                        Text("Your order")
                            .customFont(.NunitoExtraBold(size: 24))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack() {
                                ForEach(Array(self.productData.enumerated()), id: \.offset) { index, item in
                                    HStack(alignment: .top, spacing: 2) {
                                        Image(item.product.image)
                                            .resizable()
                                            .frame(width: 60, height: 60)
                                            .scaledToFit()
                                            .cornerRadius(8)
                                        VStack(alignment: .leading, spacing: 0) {
                                            Text(item.product.name)
                                                .customFont(.NunitoSemiBold(size: 17))
                                                .lineLimit(1)
                                                .multilineTextAlignment(.center)
                                                .foregroundColor(.black)
                                            Spacer()
                                            Text("\(item.product.coffeeSizes.first?.label ?? "") size \(item.product.coffeeSizes.first?.des ?? "")")
                                                .customFont(.NunitoMedium(size: 14))
                                                .foregroundColor(Colors.softGray4.value)
                                        }
                                        Spacer()
                                        VStack(alignment: .trailing, spacing: 0) {
                                            Button(action: {}) {
                                                Image(systemName: "ellipsis")
                                                    .offset(y: 4)
                                                    .foregroundColor(.black)
                                            }
                                            .padding(2)
                                            Spacer()
                                            Text(item.product.price)
                                                .customFont(.NunitoExtraBold(size: 17))
                                                .foregroundColor(Colors.mainColor.value)
                                        }
                                        Spacer()
                                            .frame(maxHeight: .infinity)
                                            .frame(width: 1.5)
                                            .background(Colors.softGray3.value)
                                            .cornerRadius(1)
                                            .padding([.horizontal], 15)
                                    }
                                    .frame(width: 300, height: 55)
                                }
                            }
                        }
                        
                        // MARK: Total prive
                        HStack(spacing: 5) {
                            Text("Total:")
                                .customFont(.NunitoRegular(size: 17))
                            Text("$17,49")
                                .customFont(.NunitoExtraBold(size: 18))
                                .foregroundColor(Colors.mainColor.value)
                            Text("~ 18")
                                .customFont(.NunitoExtraBold(size: 18))
                                .foregroundColor(.black)
                            Image(Icons.icStarGold.value)
                                .resizable()
                                .frame(width: 15, height: 15)
                        }
                        
                        // MARK: Recepient
                        Text("Recepient")
                            .customFont(.NunitoBold(size: 17))
                        ZStack() {
                            DisclosureGroup(isExpanded: $isExpandRecepientOption, content: {
                                ForEach(Array(recepientOption.enumerated()), id: \.offset){ index, item in
                                    Button(action: {
                                        currentRecepientOption = item.title
                                        withAnimation{
                                            isExpandRecepientOption = false
                                        }
                                    }) {
                                        HStack(spacing: 15) {
                                            Image(systemName: "circle")
                                                .resizable()
                                                .frame(width: 20, height: 20)
                                                .foregroundColor(.black)
                                            Text(item.title)
                                                .customFont(.NunitoBold(size: 17))
                                        }
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .frame(height: 25)
                                    }
                                }
                                .padding([.top], 15)
                            }, label: {
                                HStack(spacing: 15) {
                                    Image(systemName: "smallcircle.filled.circle")
                                        .resizable()
                                        .frame(width: 25, height: 25)
                                        .foregroundColor(Colors.mainColor.value)
                                    Text(currentRecepientOption)
                                        .customFont(.NunitoBold(size: 17))
                                }
                            })
                            .padding(10)
                            .foregroundColor(.black)
                        }
                        .frame(maxWidth: .infinity)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Colors.mainColor.value, lineWidth: 1)
                        )
                        
                        // MARK: Receivement time
                        Text("Select receivement time")
                            .customFont(.NunitoRegular(size: 17))
                        HStack(spacing: 10) {
                            HStack(spacing: 5) {
                                TextField("00", text: $hourField)
                                    .customFont(.NunitoRegular(size: 20))
                                    .keyboardType(.numberPad)
                                    .frame(width: 25)
                                    .onReceive(hourField.publisher, perform: { _ in
                                        if hourField.count > 2 {
                                            let startIndex = hourField.index(hourField.startIndex, offsetBy: 1)
                                            hourField = String(hourField[startIndex...])
                                        }
                                    })
                                Text(":")
                                    .frame(width: 5)
                                    .offset(y: -2)
                                TextField("00", text: $minuteField)
                                    .keyboardType(.numberPad)
                                    .customFont(.NunitoRegular(size: 20))
                                    .frame(width: 25).onReceive(minuteField.publisher, perform: { _ in
                                        if minuteField.count > 2 {
                                            let startIndex = minuteField.index(minuteField.startIndex, offsetBy: 1)
                                            minuteField = String(minuteField[startIndex...])
                                        }
                                    })
                            }
                            .frame(height: 35)
                            .padding([.horizontal], 8)
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(Colors.mainColor.value, lineWidth: 1)
                            )
                            
                            CustomSegmentedPickerView(selection: $timeSegmentIndex, contents: [
                                SegmentView(id: 0, title: "AM", content: EmptyView()),
                                SegmentView(id: 1, title: "PM", content: EmptyView())
                            ], isNobody: true)
                            .frame(width: 100)
                            
                            Text("(soon)")
                                .customFont(.NunitoRegular(size: 16))
                        }
                        
                        // MARK: Payment
                        Text("Payment")
                            .customFont(.NunitoBold(size: 17))
                        HStack() {
                            ForEach(Array(self.paymentOption.enumerated()), id: \.offset){index, item in
                                Button(action: {paymentSelected = index}, label: {
                                    ZStack{
                                        VStack(spacing: 2) {
                                            Image(systemName: "circle")
                                                .resizable()
                                                .frame(width: 40, height: 40)
                                                .foregroundColor(paymentSelected != index ? Colors.mainColor.value : Color.white)
                                            Text(item.title)
                                                .customFont(.NunitoLight(size: 13))
                                                .foregroundStyle(paymentSelected == index ? Color.white : Color.black)
                                        }
                                        .frame(width: 80, height: 80)
                                        .background(paymentSelected != index ? Colors.softBlueBg.value : Colors.mainColor.value)
                                        .cornerRadius(12)
                                        .padding(1)
                                    }
                                })
                            }
                        }
                        
                        // MARK: Store
                        Text("Payment")
                            .customFont(.NunitoBold(size: 17))
                        ScrollView(.horizontal, showsIndicators: false, content: {
                            HStack(spacing: 15) {
                                ForEach(shopData, id: \.self) { item in
                                    CoffeeShopView(item: item)
                                }
                            }
                        })
                        
                    })
                    .padding([.horizontal], 0.5)
                }
                
                // MARK: Pay button
                Spacer()
                NavigationLink(
                    destination: SuccessVC()
                        .customHeader(backTitle: "Home", title: "You purchase", backToRoot: true)
                    , label: {
                        Text("pay")
                            .customFont(.NunitoSemiBold(size: 17))
                            .foregroundStyle(.white)
                            .padding(12)
                            .frame(maxWidth: .infinity, alignment: .center)
                            .background(Colors.mainColor.value)
                            .cornerRadius(10)
                    }
                )
                .buttonStyle(PlainButtonStyle())
            }
            .padding([.horizontal], 18)
        })
        .onAppear{firstAppear()}
        .onTapGesture {
            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
        }
    }
}

#Preview {
    yourOrderVC()
}
