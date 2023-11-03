//
//  GiftVC.swift
//  StarbuckRevamp
//
//  Created by Sao Sophea on 30/10/23.
//

import SwiftUI

struct GiftVC: View {
    let productCategory = [
        ProductCategoryModel(name: "Drinks", id: 1),
        ProductCategoryModel(name: "Food", id: 2),
        ProductCategoryModel(name: "Merchandise", id: 3),
        ProductCategoryModel(name: "Fruid", id: 4),
        ProductCategoryModel(name: "Drinks", id: 5),
        ProductCategoryModel(name: "Food", id: 6),
    ]
    
    let giftCards = ["payWithStar", "payWithStar", "payWithStar", "payWithStar", "payWithStar"]
    @State var searchText = ""
    @State var cgIdSelected = 1
    
    func onFirstAppear() {
    }
    
    
    var body: some View {
        ZStack(alignment: .top, content: {
            Colors.appBg.value.ignoresSafeArea()
            
            VStack(alignment: .leading, spacing: 0) {
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
                
                ScrollView(.vertical, showsIndicators: false) {
                    VStack{
                        ForEach(giftCards, id: \.self){ item in
                            Image(item)
                                .resizable()
                                .frame(height: 200)
                                .scaledToFit()
                                .cornerRadius(12)
                        }
                    }
                }
                .padding([.top], 10)
            }
            .padding([.trailing, .leading], 18)
        })
        .onAppear(perform: {onFirstAppear()})
        .onTapGesture {
            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
        }
    }
}


#Preview {
    GiftVC()
}
