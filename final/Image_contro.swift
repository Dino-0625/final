//
//  Image_contro.swift
//  final
//
//  Created by User11 on 2021/1/6.
//

import Foundation
import SwiftUI
struct ImagePickerController: UIViewControllerRepresentable {
    func updateUIViewController(_ uiViewController:
    UIImagePickerController, context: Context) {

    }

    func makeUIViewController(context: Context) ->
    UIImagePickerController {
    let controller = UIImagePickerController()
    controller.sourceType = .photoLibrary
    return controller
    }
    
    
}
