//
//  File.swift
//  TesteWWDC
//
//  Created by Julia Mendes on 11/04/23.
//

import Foundation
import SpriteKit


extension KnapsackScene {
    struct bitMask {
        static let sprite: UInt = 4
    }
    
    //tambem passar tamanhos e posição pra funcao tbm
    
    func addJewelry(jewelry: Jewelry) {
        jewelry.physicsBody?.affectedByGravity = false
        jewelry.physicsBody?.allowsRotation = false
        jewelry.physicsBody?.isDynamic = true
        jewelry.physicsBody?.categoryBitMask = UInt32(bitMask.sprite)
        addChild(jewelry)
    }
    
    func addKnapsack(knapsack: SKSpriteNode, knapsackName: String) {
        //knapsack.size = CGSize(width: 400, height: 400)
        knapsack.position = CGPoint(x: 700, y: 600)
        knapsack.name = knapsackName
        knapsack.physicsBody?.affectedByGravity = false
        knapsack.physicsBody?.allowsRotation = false
        knapsack.physicsBody?.isDynamic = true
        knapsack.physicsBody?.categoryBitMask = UInt32(bitMask.sprite)
        //deixar como contato por enquanto
        
        addChild(knapsack)
    }
}

func background(background: SKSpriteNode) {
    background.position = CGPoint(x: background.frame.size.width / 2, y: background.frame.size.height / 2)
    background.size = CGSize(width: background.frame.size.width, height: background.frame.size.height)
}
