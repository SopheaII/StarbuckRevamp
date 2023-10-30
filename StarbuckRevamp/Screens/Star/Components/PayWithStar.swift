//
//  PayWithStar.swift
//  StarbuckRevamp
//
//  Created by Sao Sophea on 30/10/23.
//

import SwiftUI

struct PayWithStar: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack() {
                Image(Icons.payWithStar.value)
                    .resizable()
                    .frame(height: 200)
                    .scaledToFit()
                    .cornerRadius(14)
                    .offset(y: 8)
                
                VStack(alignment: .center) {
                    Text("Scan to pay")
                        .customFont(.NunitoSemiBold(size: 17))
                    HStack(alignment: .center, spacing: 4) {
                        Text("1").customFont(.NunitoRegular(size: 16))
                            .foregroundColor(Colors.gold.value)
                        Image(Icons.icStarGold.value)
                            .resizable()
                            .frame(width: 15, height: 15)
                        Text("~ $1").customFont(.NunitoRegular(size: 16))
                    }
                    Image(Icons.QRcode.value)
                        .resizable()
                        .frame(width: 200, height: 200)
                        .scaledToFit()
                    
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
    PayWithStar()
}
