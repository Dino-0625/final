//
//  UIRepresentable.swift
//  final
//
//  Created by User12 on 2021/1/9.
//
import Foundation
import SwiftUI
import UIKit
struct EmitterLayerView: UIViewRepresentable {
    func makeUIView(context: Context) -> UIView {
        let view = UIView()
        let snowEmitterCell = CAEmitterCell()
           snowEmitterCell.contents = UIImage(named: "snowflake")?.cgImage
           snowEmitterCell.birthRate = 4
           snowEmitterCell.lifetime = 4
           snowEmitterCell.velocity = 100
           snowEmitterCell.scale = 0.1
           //snowEmitterCell.yAcceleration = 30
           
           
           let snowEmitterLayer = CAEmitterLayer()
       
           snowEmitterLayer.emitterCells = [snowEmitterCell]
        
           view.layer.addSublayer(snowEmitterLayer)
        
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
    }
    
    typealias UIViewType = UIView
}
