//
//  ProductDetailVC.swift
//  StarbuckRevamp
//
//  Created by Sao Sophea on 31/10/23.
//

import SwiftUI

struct ProductDetailVC: View {
    var productData: ProductModel
    @State var searchText = ""
    @State var cfSizeSelected = -1
    @State var showContent = true
    
    let short   = "sz1"
    let tall    = "sz2"
    let grande  = "sz3"
    let venti   = "sz4"
    
    var cupSizes: [Int]
    @State var addInsSearch = ""
    @State var flavorSearch = ""
    @State var isFavClicked : Bool = false
    
    init(productData: ProductModel, searchText: String = "", cfSizeSelected: Int = 0, cupSizes: [Int] = []) {
        self.productData = productData
        self.searchText = searchText
        self.cfSizeSelected = cfSizeSelected
        self.cupSizes = cupSizes
        self.isFavClicked = productData.isFavorite
        
        for i in productData.coffeeSizes {
            switch i.size {
            case short:
                self.cupSizes.append(26)
            case tall:
                self.cupSizes.append(30)
            case grande:
                self.cupSizes.append(35)
            case venti:
                self.cupSizes.append(40)
            default:
                self.cupSizes.append(30)
            }
        }
    }
    
    var body: some View {
        ZStack(alignment: .top, content: {
            Colors.appBg.value.ignoresSafeArea()
            
            VStack(alignment: .leading){
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(alignment: .leading, spacing: 0) {
                        // MARK: Header
                        ZStack(alignment: .top) {
                            Image(productData.image)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 150)
                            Button(action:{isFavClicked.toggle()}) {
                                Image(isFavClicked ? Icons.icHeardFill.value : Icons.icHeard.value)
                                    .resizable()
                            }
                            .offset(x: -25, y: 15)
                            .frame(width: 30, height: 30)
                            .frame(maxWidth: .infinity, alignment: .topTrailing)
                            .buttonStyle(ScaleButtonStyle())
                            
                            Text(productData.name)
                                .customFont(.NunitoBold(size: 18))
                                .lineLimit(1)
                                .multilineTextAlignment(.center)
                                .frame(height: 50)
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomLeading)
                                .offset(x: 20)
                        }
                        .frame(maxWidth: .infinity)
                        .frame(height: 200)
                        .background(Colors.mainColor.value)
                        .cornerRadius(12)
                        
                        // MARK: nutrition facts
                        HStack() {
                            Text("\(FloatHelper.formatFloatValue(productData.ccal)) ccal")
                                .customFont(.NunitoRegular(size: 17))
                                .lineLimit(1)
                                .multilineTextAlignment(.center)
                                .padding([.top], 8)
                            Spacer()
                            Text("Nutrition facts")
                                .customFont(.NunitoRegular(size: 17))
                                .lineLimit(1)
                                .multilineTextAlignment(.center)
                                .padding([.top], 8)
                                .underline()
                        }
                        .padding([.top], 10)
                        
                        // MARK: Ingrediencts
                        Text("Ingrediencts")
                            .customFont(.NunitoBold(size: 17))
                            .lineLimit(1)
                            .multilineTextAlignment(.center)
                            .foregroundColor(.black)
                            .padding([.top], 20)
                        
                        Text(productData.ingredient)
                            .customFont(.NunitoRegular(size: 15))
                            .lineLimit(1)
                            .multilineTextAlignment(.center)
                            .foregroundColor(Colors.softGray5.value)
                            .padding([.top], 8)
                        
                        // MARK: Coffee size
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack() {
                                ForEach(Array(self.productData.coffeeSizes.enumerated()), id: \.offset){index, item in
                                    Button(action: {cfSizeSelected = index}, label: {
                                        ZStack{
                                            VStack(spacing: 2) {
                                                Image(cfSizeSelected != index ? Icons.icCup.value : Icons.icCupGray.value)
                                                    .resizable()
                                                    .frame(width: CGFloat(cupSizes[index]), height: CGFloat(cupSizes[index]))
                                                Text(item.des)
                                                    .customFont(.NunitoLight(size: 13))
                                                    .foregroundStyle(cfSizeSelected == index ? Color.white : Color.black)
                                            }
                                            .frame(width: 80, height: 80)
                                            .background(cfSizeSelected == index ? Colors.mainColor.value : Color.white)
                                            .cornerRadius(50)
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 50)
                                                    .stroke(Colors.mainColor.value, lineWidth: cfSizeSelected != index ? 1:0)
                                            )
                                            .padding(1)
                                        }
                                    })
                                }
                            }
                        }
                        .padding([.top], 20)
                        
                        // MARK: Customizations
                        Text("Customizations")
                            .customFont(.NunitoBold(size: 17))
                            .lineLimit(1)
                            .multilineTextAlignment(.center)
                            .foregroundColor(.black)
                            .padding([.top], 20)
                        
                        DisclosureGroup(content: {
                            TextField("Add-ins", text: $addInsSearch)
                                .customFont(.NunitoRegular(size: 17))
                                .listRowInsets(EdgeInsets(top: 0,
                                                          leading: 0,
                                                          bottom: 0,
                                                          trailing: 16))
                        }, label: {
                            HStack() {
                                Text("Add-ins")
                                    .customFont(.NunitoRegular(size: 17))
                                Spacer()
                                Text("Edit")
                                    .customFont(.NunitoRegular(size: 17))
                            }
                        })
                        .foregroundColor(.black)
                        .padding([.top], 20)
                        Spacer()
                            .frame(maxWidth: .infinity)
                            .frame(height: 1)
                            .background(Colors.softGray3.value)
                        
                        DisclosureGroup(content: {
                            TextField("Flavors", text: $flavorSearch)
                                .customFont(.NunitoRegular(size: 17))
                                .listRowInsets(EdgeInsets(top: 0,
                                                          leading: 0,
                                                          bottom: 0,
                                                          trailing: 16))
                        }, label: {
                            HStack() {
                                Text("Flavors")
                                    .customFont(.NunitoRegular(size: 17))
                                Spacer()
                                Text("Edit")
                                    .customFont(.NunitoRegular(size: 17))
                            }
                        })
                        .foregroundColor(.black)
                        .padding([.top], 20)
                        Spacer()
                            .frame(maxWidth: .infinity)
                            .frame(height: 1)
                            .background(Colors.softGray3.value)
                    }
                }
                
                Spacer()
                
                // MARK: Button
                HStack() {
                    Text("\(productData.price)")
                        .customFont(.NunitoExtraBold(size: 30))
                        .foregroundColor(Colors.mainColor.value)
                    Spacer()
                    Button(action: {}) {
                        ZStack{
                            Text("Add to basket")
                                .customFont(.NunitoSemiBold(size: 18))
                                .foregroundStyle(.white)
                                .padding(15)
                                .frame(maxWidth: .infinity, alignment: .center)
                                .frame(width: 210)
                                .background(Colors.mainColor.value)
                                .cornerRadius(10)
                        }
                    }
                }
                .padding([.horizontal], 20)
                .frame(maxWidth: .infinity)
                .padding([.bottom], 1)
            }
            .padding([.top], 10)
            .padding([.trailing, .leading], 18)
            
        })
        .onTapGesture {
            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
        }
    }
}

#Preview {
    ProductDetailVC(productData: ProductModel(name: "Veranda blend", image: "coffee1", isFavorite: true, ingredient: "Brewed Decaf Coffee", coffeeSizes: [
        CoffeeSize(size: "sz1", label: "Short", des: "8(fl oz)", image: ""),
        CoffeeSize(size: "sz2", label: "Tall", des: "12(fl oz)", image: ""),
        CoffeeSize(size: "sz3", label: "Grande", des: "16(fl oz)", image: ""),
        CoffeeSize(size: "sz4", label: "Venti", des: "20(fl oz)", image: "")
    ], addIns: "", flavors: "", price: "$1.78", location: "108th Ave Ne 140", ccal: 5))
}
