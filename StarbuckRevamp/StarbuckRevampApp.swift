//
//  StarbuckRevampApp.swift
//  StarbuckRevamp
//
//  Created by Sao Sophea on 25/10/23.
//

import SwiftUI

@main
struct StarbuckRevampApp: App {
    @State var isNavigatetoNavBar = true
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                VStack {
                    Button {
                        isNavigatetoNavBar = true
                    } label: {
                        Text("Navigate Button")
                    }
                }
                .navigationTitle("Navigation")
                .navigationDestination(isPresented: $isNavigatetoNavBar) {
                    NavBar().navigationBarBackButtonHidden(true).navigationBarHidden(true)
                }
            }
            .navigationViewStyle(.stack)
        }
    }
}
