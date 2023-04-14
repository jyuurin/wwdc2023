//
//  File.swift
//  TesteWWDC
//
//  Created by Julia Mendes on 13/04/23.
//

import Foundation
import SpriteKit

//pros itens
class Jewelry : SKSpriteNode {
    
    var weight : Int = 0
    var value : Int = 0
    
    init(texture: SKTexture?, color: UIColor, size: CGSize, name: String, weight: Int, value: Int, position: CGPoint) {
        //Init from SKSpriteNode
        super.init(texture: texture, color: color, size: size)
        //My init
        self.name = name
        self.position = position
        self.weight = weight
        self.value = value
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    static func jewelryList() -> [Jewelry] {
        return [
            Jewelry(texture: nil, color: .cyan, size: CGSize(width: 50.0, height: 50.0), name: "colar", weight: 5, value: 10, position: CGPoint(x: 100.0, y: 100.0)),
            Jewelry(texture: nil, color: .red, size: CGSize(width: 50.0, height: 50.0), name: "brinco", weight: 8, value: 6, position: CGPoint(x: 100.0, y: 300.0)),
            Jewelry(texture: nil, color: .orange, size: CGSize(width: 50.0, height: 50.0), name: "pulseira", weight: 9, value: 9, position: CGPoint(x: 100.0, y: 500.0)),
            Jewelry(texture: nil, color: .yellow, size: CGSize(width: 50.0, height: 50.0), name: "chaveiro", weight: 3, value: 5, position: CGPoint(x: 100.0, y: 700.0))
        ]
    }
    
}
