//
//  CoffeeShopDetailVC.swift
//  StarbuckRevamp
//
//  Created by Sao Sophea on 2/11/23.
//

import SwiftUI

struct GiftDetailVC: View {
    let amountSet = ["$10", "$20", "$50", "$100"]
    @State var customAmount = ""
    @FocusState private var isCustomFocusAmount: Bool?
    @State var currentSelected = -1
    @State var senderName = ""
    @State var senderMail = ""
    @State var receiverName = ""
    @State var receiverMail = ""
    @State var toggleAnonymous = false
    
    func onFirstAppear() {
    }
    var body: some View {
        ZStack(alignment: .top, content: {
            Colors.appBg.value.ignoresSafeArea()
            
            VStack(alignment: .leading, spacing: 15, content: {
                // MARK: Header
                Image(Icons.giftImage.value)
                    .resizable()
                    .frame(maxWidth: .infinity)
                    .frame(height: 200)
                    .cornerRadius(12)
                
                ScrollView(.vertical, showsIndicators: false, content: {
                    
                    VStack(alignment: .leading, spacing: 15) {
                        // MARK: Gift amount
                        Text("Recepient")
                            .customFont(.NunitoBold(size: 17))
                        ScrollView(.horizontal, showsIndicators: false, content: {
                            HStack() {
                                ForEach(Array(amountSet.enumerated()), id: \.offset) { index, item in
                                    Button(action: {currentSelected = index}) {
                                        Text(item)
                                            .customFont(.NunitoBold(size: 17))
                                            .frame(width: 50, height: 50)
                                            .foregroundColor(currentSelected == index ? Color.white : Colors.mainColor.value)
                                            .background(currentSelected == index ? Colors.mainColor.value : Colors.softBlueBg.value)
                                            .cornerRadius(5)
                                    }
                                }
                                Button(action: {currentSelected = -99}) {
                                    ZStack() {
                                        TextField("Edit", text: $customAmount)
                                            .focused($isCustomFocusAmount, equals: true)
                                            .foregroundColor(currentSelected == -99 ? Color.white : Colors.mainColor.value)
                                            .customFont(.NunitoBold(size: 17))
                                            .keyboardType(.numberPad)
                                            .padding(4)
                                            .onReceive(customAmount.publisher, perform: { _ in
                                                if customAmount.prefix(1) == "0" {
                                                    customAmount = String(customAmount.dropFirst())
                                                }else if Float(customAmount) ?? 0 >= 1000 {
                                                    customAmount = String(customAmount.dropLast())
                                                }
                                            })
                                    }
                                    .frame(width: 50, height: 50)
                                    .background(currentSelected == -99 ? Colors.mainColor.value : Colors.softBlueBg.value)
                                    .cornerRadius(5)
                                }
                            }
                        })
                        
                        
                        // MARK: Sender info
                        Text("From")
                            .customFont(.NunitoBold(size: 17))
                        VStack(alignment: .leading, spacing: 4) {
                            Text("Name")
                                .customFont(.NunitoRegular(size: 15))
                            TextField("Name", text: $senderName)
                                .frame(height: 40)
                                .padding([.horizontal], 10)
                                .padding([.vertical], 3)
                                .customFont(.NunitoRegular(size: 15))
                                .customShadow()
                                .padding(3)
                        }
                        VStack(alignment: .leading, spacing: 4) {
                            Text("Email")
                                .customFont(.NunitoRegular(size: 15))
                            
                            TextField("Email", text: $senderMail)
                                .frame(height: 40)
                                .padding([.horizontal], 10)
                                .padding([.vertical], 3)
                                .customFont(.NunitoRegular(size: 15))
                                .customShadow()
                                .padding(3)
                        }
                        
                        // MARK: Anomymous toggle
                        HStack() {
                            Text("Anonymous gift")
                                .customFont(.NunitoRegular(size: 15))
                            Spacer()
                            Toggle(isOn: $toggleAnonymous, label: {
                                
                            })
                            .padding([.trailing], 2)
                        }
                        
                        // MARK: Receiver info
                        Text("To")
                            .customFont(.NunitoBold(size: 17))
                        VStack(alignment: .leading, spacing: 4) {
                            Text("Name")
                                .customFont(.NunitoRegular(size: 15))
                            TextField("Name", text: $receiverName)
                                .frame(height: 40)
                                .padding([.horizontal], 10)
                                .padding([.vertical], 3)
                                .customFont(.NunitoRegular(size: 15))
                                .customShadow()
                                .padding(3)
                        }
                        VStack(alignment: .leading, spacing: 4) {
                            Text("Email")
                                .customFont(.NunitoRegular(size: 15))
                            
                            TextField("Email", text: $receiverMail)
                                .frame(height: 40)
                                .padding([.horizontal], 10)
                                .padding([.vertical], 3)
                                .customFont(.NunitoRegular(size: 15))
                                .customShadow()
                                .padding(3)
                        }
                        
                        
                    }
                })
                
                // MARK: Pay button
                Button(action: {}){
                    Text("Send a gift")
                        .customFont(.NunitoSemiBold(size: 17))
                        .foregroundStyle(.white)
                        .padding(12)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .background(Colors.mainColor.value)
                        .cornerRadius(10)
                }
                .buttonStyle(PlainButtonStyle())
                .buttonStyle(PlainButtonStyle())
            })
            .padding([.horizontal], 18)
            
        })
        .onAppear(perform: {onFirstAppear()})
        .onTapGesture {
            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
        }
    }
}

#Preview {
    GiftDetailVC()
}
