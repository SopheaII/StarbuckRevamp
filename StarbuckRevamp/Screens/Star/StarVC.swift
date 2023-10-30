//
//  StarVC.swift
//  StarbuckRevamp
//
//  Created by Sao Sophea on 27/10/23.
//

import SwiftUI

struct StarVC: View {
    @State private var category = Category.payWithStar
    @State var segmentIndex = 0
    var viewWidth = UIScreen.main.bounds.width
    var test = [Text("ksjfsdf"), Text("sldjflsdjflsdjf")]
    
    func onFirstAppear() {
    }
    var body: some View {
        ZStack(alignment: .top, content: {
            Colors.appBg.value.ignoresSafeArea()
            
            VStack(alignment: .leading, spacing: 0, content: {
                // MARK: Header
                Text("Stars")
                    .customFont(.NunitoExtraBold(size: 28))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                // MARK: Segment
                CustomSegmentedPickerView(selection: $segmentIndex, contents: [
                    SegmentView(id: 0, title: "Pay with stars", content: PayWithStar()),
                    SegmentView(id: 1, title: "Scan to earn", content: ScanToEarn()),
                ])
                    .onChange(of: segmentIndex, {
                        print("Segment selected \(segmentIndex)")
                    })
                    .padding([.top], 10)

            })
            .padding([.trailing, .leading], 18)
            
        })
        .onAppear(perform: {onFirstAppear()})
    }
}

#Preview {
    StarVC()
}
