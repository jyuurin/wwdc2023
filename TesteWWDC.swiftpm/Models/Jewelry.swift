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
            Jewelry(texture: SKTexture(imageNamed: "keychain"), color: .cyan, size: CGSize(width: 250, height: 250), name: "keychain", weight: 30, value: 10, position: CGPoint(x: 100, y: 150)),
            Jewelry(texture: SKTexture(imageNamed: "bracelet"), color: .red, size: CGSize(width: 270, height: 270), name: "bracelet", weight: 20, value: 40, position: CGPoint(x: 250, y: 300)),
            Jewelry(texture: SKTexture(imageNamed: "earrings"), color: .orange, size: CGSize(width: 250, height: 250), name: "earrings", weight: 10, value: 20, position: CGPoint(x: 130, y: 470)),
            Jewelry(texture: SKTexture(imageNamed: "necklace"), color: .yellow, size: CGSize(width: 270, height: 270), name: "necklace", weight: 40, value: 30, position: CGPoint(x: 250, y: 630))
        ]
    }
}
