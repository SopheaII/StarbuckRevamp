//
//  ScanToEarn.swift
//  StarbuckRevamp
//
//  Created by Sao Sophea on 30/10/23.
//

import SwiftUI

struct ScanToEarn: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack() {
                Image(Icons.scanToEarn.value)
                    .resizable()
                    .frame(height: 200)
                    .scaledToFit()
                    .cornerRadius(14)
                    .offset(y: 8)
                
                
                VStack(alignment: .center, spacing: 5) {
                    Text("Scan to collect stars")
                        .customFont(.NunitoBold(size: 23))
                    HStack(alignment: .center, spacing: 4) {
                        Text("Collect 4").customFont(.NunitoRegular(size: 16))
                        Image(Icons.icStarGold.value)
                            .resizable()
                            .frame(width: 15, height: 15)
                        Text("per 10 AED").customFont(.NunitoRegular(size: 16))
                    }
                    
                    ZStack(alignment: .top) {
                        HStack() {
                            Text("Rewards")
                                .customFont(.NunitoSemiBold(size: 20))
                            Image(Icons.icStarGold.value)
                                .resizable()
                                .frame(width: 18, height: 18)
                        }
                        .padding([.horizontal], 10)
                        .padding([.vertical], 3)
                        .background(
                            Rectangle()
                                .fill(Color.white)
                                .cornerRadius(8)
                                .shadow(
                                    color: Color.gray.opacity(0.4),
                                    radius: 8,
                                    x: 0,
                                    y: 5
                                )
                        )
                        
                        Text("2")
                            .customFont(.NunitoSemiBold(size: 14))
                            .foregroundColor(.white)
                            .frame(width: 22, height: 22)
                            .background(Colors.mainColor.value)
                            .cornerRadius(5)
                            .padding(2)
                            .background(.white)
                            .cornerRadius(6)
                            .offset(x: 67, y: -10)
                    }
                    .padding([.top], 20)
                    
                    Image(Icons.QRcode.value)
                        .resizable()
                        .frame(width: 200, height: 200)
                        .scaledToFit()
                        .padding([.top], 10)
                    
                    
                    Text("This code works in all offline stores when scanning.")
                        .customFont(.NunitoRegular(size: 17))
                        .multilineTextAlignment(.center)
                }
                .offset(y: 10)
            }
        }
    }
}

#Preview {
    ScanToEarn()
}
