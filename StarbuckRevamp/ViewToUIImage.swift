//
//  ViewToUIImage.swift
//  StarbuckRevamp
//
//  Created by Sao Sophea on 27/10/23.
//

import SwiftUI

class ViewToUIImage {
    static func viewToUIImageConvertor<Content: View>(content: Content) -> UIImage? {
        let controller = UIHostingController(rootView: content)
        let view = controller.view
        
        let targetSize = controller.view.intrinsicContentSize
        
        view?.bounds = CGRect(origin: .zero, size: targetSize)
        view?.backgroundColor = UIColor.clear
        
        let renderer = UIGraphicsImageRenderer(size: targetSize)
        
        return renderer.image { _ in
            view?.drawHierarchy(in: controller.view.bounds, afterScreenUpdates: true)
        }
    }
}
