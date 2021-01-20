//
//  ViewController.swift
//  final
//
//  Created by User12 on 2021/1/9.
//
import UIKit
import Foundation
import SwiftUI
class ViewController : UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
       super.viewDidLoad()
       view.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.4)
       let snowEmitterCell = CAEmitterCell()
       snowEmitterCell.contents = UIImage(named: "snowflake")?.cgImage
       snowEmitterCell.birthRate = 1
       snowEmitterCell.lifetime = 2
       snowEmitterCell.velocity = 100
       let snowEmitterLayer = CAEmitterLayer()
       snowEmitterLayer.emitterCells = [snowEmitterCell]
       view.layer.addSublayer(snowEmitterLayer)
    }
}
