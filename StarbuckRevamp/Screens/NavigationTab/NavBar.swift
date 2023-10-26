//
//  NavBar.swift
//  starbucksRevamp
//
//  Created by Sao Sophea on 25/10/23.
//

import SwiftUI

struct NavBar: View {
    @State private var selection = 0
    let image = UIImage.gradientImageWithBounds(
        bounds: CGRect( x: 0, y: 0, width: UIScreen.main.scale, height: 13),
        colors: [
            UIColor.clear.cgColor,
            UIColor.black.withAlphaComponent(0.08).cgColor
        ]
    )
    
    init() {
        let appearance = UITabBarAppearance()
        appearance.backgroundImage = UIImage()
        appearance.shadowImage = image
        UITabBar.appearance().standardAppearance = appearance
        UITabBar.appearance().backgroundColor = UIColor.white
    }
    
    var body: some View {
        TabView(selection: $selection){
            HomeVC().tabItem{
                if selection == 0 {
                    Image(Icons.icHomeSelected.value)
                } else {
                    Image(Icons.icHomeGray.value)
                        .background(Color.red)
                }
                Text("Home")
            }.tag(0)
            Text("Order screen").tabItem{
                if selection == 1 {
                    Image(Icons.icHotCupSelected.value)
                } else {
                    Image(Icons.icHotCupGray.value)
                }
                Text("Order")
            }.tag(1)
            Text("Start screen").tabItem{
                if selection == 2 {
                    Image(Icons.icStarSelected.value)
                } else {
                    Image(Icons.icStarGray.value)
                }
                Text("Stars")
            }.tag(2)
            
            Text("Basket screen")
                .tabItem{
                    if selection == 3 {
                        Image(Icons.icBasketSelected.value)
                    } else {
                        Image(Icons.icBasketGray.value)
                    }
                    Text("Basket")
                }.tag(3)
            Text("Account screen")
                .tabItem{
                    if selection == 4 {
                        Image(Icons.icAccountSelected.value)
                    } else {
                        Image(Icons.icAccountGray.value)
                    }
                    Text("Account")
                }.tag(4)
        }
        .padding([.leading, .trailing], 10)
        .accentColor(Colors.mainColor.value)
    }
}

#Preview {
    NavBar()
        .previewDevice("iPhone 15 Pro Max")
}
