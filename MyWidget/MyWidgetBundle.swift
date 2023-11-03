//
//  MyWidgetBundle.swift
//  MyWidget
//
//  Created by Sao Sophea on 3/11/23.
//

import WidgetKit
import SwiftUI

@main
struct MyWidgetBundle: WidgetBundle {
    var body: some Widget {
        MyWidget()
        MyWidgetLiveActivity()
    }
}
