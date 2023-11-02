//
//  CustomSegment.swift
//  StarbuckRevamp
//
//  Created by Sao Sophea on 27/10/23.
//

import SwiftUI

struct SegmentView: Identifiable {
    let id: Int
    let title: String
    let content: AnyView
}

extension SegmentView {
    init<TheView: View>(id: Int, title: String, content: TheView) {
        self.id      = id
        self.title   = title
        self.content = AnyView(content)
    }
}

struct CustomSegmentedPickerView: View{
    @Binding var selection: Int
    let contents: [SegmentView]
    var isNobody = false
    
    @State private var frames = Array<CGRect>(repeating: .zero, count: 10)
    var viewWidth             = UIScreen.main.bounds.width
    
    func onFirstAppear() {
        frames = Array<CGRect>(repeating: .zero, count: contents.count)
    }
    
    var body: some View {
        HStack(spacing: 10) {
            ForEach(self.contents.indices, id: \.self) { index in
                Button(action: { self.selection = index }) {
                    Text(self.contents[index].title)
                        .customFont(.NunitoRegular(size: 17))
                        .foregroundColor(selection == index ? Colors.mainColor.value : Color.black)
                }
                .frame(maxWidth: .infinity)
                .padding(EdgeInsets(top: 8, leading: 5, bottom: 8, trailing: 5)).background(
                    GeometryReader { geo in
                        Color.clear.onAppear { self.setFrame(index: index, frame: geo.frame(in: .global)) }
                    }
                )
            }
        }
        .background(
            Color(.white)
                .frame(width: self.frames[self.selection].width,
                       height: 33, alignment: .topLeading)
                .cornerRadius(8)
                .offset(x: self.frames[self.selection].minX - self.frames[0].minX + CGFloat(selection == 0 ? 3 : -3))
            , alignment: .leading)
        .animation(.default, value: selection)
        .frame(maxWidth: .infinity)
        .background(Colors.softBlueBg.value)
        .cornerRadius(10)
        .onAppear(perform: {
            onFirstAppear()
        })
        if !isNobody{
            ZStack() {
                ForEach(Array(self.contents.enumerated()), id: \.offset){ index, view in
                    view.content
                        .offset(x: viewWidth*CGFloat(index))
                }
            }
            .offset(x: -(viewWidth*CGFloat(selection)))
            .animation(.easeInOut, value: selection)        }
    }
    
    func setFrame(index: Int, frame: CGRect) {
        self.frames[index] = frame
    }
}
