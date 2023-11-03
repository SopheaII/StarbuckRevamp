//
//  SuccessVC.swift
//  StarbuckRevamp
//
//  Created by Sao Sophea on 2/11/23.
//

import SwiftUI

struct SuccessVC: View {
    let itemFields = [ItemField(id: 1, key: "Date", value: "27 Jun 2023"), ItemField(id: 2, key: "Store", value: "3245 MCAuley Blvd"), ItemField(id: 3, key: "Order", value: "#998473")]
    
    func onFirstAppear() {
        
    }
    var body: some View {
        ZStack(alignment: .top, content: {
            Colors.appBg.value.ignoresSafeArea()
            
            VStack(alignment: .center, spacing: 0, content: {
                VStack(alignment: .center, spacing: 10) {
                    Image(Icons.QRcode.value)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 250, height: 250)
                    HStack(alignment: .center, spacing: 15) {
                        VStack(alignment: .leading, spacing: 7) {
                            ForEach(itemFields, id: \.id) { field in
                                Text(field.key)
                                    .customFont(.NunitoBold(size: 15))
                                    .lineLimit(1)
                            }
                            
                        }
                        VStack(alignment: .leading, spacing: 7) {
                            ForEach(itemFields, id: \.id) { field in
                                Text(field.value)
                                    .customFont(.NunitoRegular(size: 15))
                                    .lineLimit(1)
                            }
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .frame(height: 400)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Colors.mainColor.value, lineWidth: 1)
                )
                
                // MARK: Description
                Text("Scan this barcode in store where you made an order.")
                    .customFont(.NunitoRegular(size: 17))
                    .multilineTextAlignment(.center)
                    .frame(width: 300)
                    .padding([.top], 80)
            })
            .padding([.horizontal], 18)
            
        })
        .onAppear(perform: {onFirstAppear()})
    }
}

#Preview {
    SuccessVC()
}
