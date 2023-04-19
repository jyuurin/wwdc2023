//
//  Functions.swift
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
    
    func addBackground(bgname: String) {
        let background = SKSpriteNode(imageNamed: bgname)
        background.position = CGPoint(x: frame.midX , y: frame.midY + 50)
        background.size = CGSize(width: frame.size.width, height: frame.size.height * 1.2)
        
        addChild(background)
    }
    
    func addSpriteJewelry(jewelry: Jewelry) {
        jewelry.physicsBody?.affectedByGravity = false
        jewelry.physicsBody?.allowsRotation = false
        jewelry.physicsBody?.isDynamic = true
        jewelry.physicsBody?.categoryBitMask = UInt32(bitMask.sprite)
        addChild(jewelry)
    }
    
    func addSpriteKnapsack(knapsack: SKSpriteNode, knapsackName: String) {
        knapsack.size = CGSize(width: 470, height: 470)
        knapsack.position = CGPoint(x: frame.maxX - 300, y: frame.midY + 230)
        knapsack.name = knapsackName
        knapsack.physicsBody?.affectedByGravity = false
        knapsack.physicsBody?.allowsRotation = false
        knapsack.physicsBody?.isDynamic = true
        knapsack.physicsBody?.categoryBitMask = UInt32(bitMask.sprite)
        
        addChild(knapsack)
    }
    
    func addSpriteButton(position: CGPoint) {
        let buttonSprite : SKSpriteNode = SKSpriteNode(imageNamed: "button-zipper")
        buttonSprite.size = CGSize(width: 300, height: 300)
        buttonSprite.position = position
        buttonSprite.name = "button"
        buttonSprite.physicsBody?.affectedByGravity = false
        buttonSprite.physicsBody?.allowsRotation = false
        buttonSprite.physicsBody?.isDynamic = true
        
        
        addChild(buttonSprite)
    }
    
    
    func addJewelryKnapsack(jewelry : Jewelry) {
        knapsackItens.append(jewelry)
        jewelry.position = itemSlot[knapsackItens.count - 1]
        jewelry.size = CGSize(width: 100, height: 100)
        addTextCount()
    }
    
    func removeJewelryKnapsack(jewelry : Jewelry) {
        knapsackItens.removeAll(where: {$0.name == jewelry.name})
        let OriginalJewelry = Jewelry.jewelryList()
        jewelry.position = OriginalJewelry.first(where: {$0.name == jewelry.name})!.position
        jewelry.size = OriginalJewelry.first(where: {$0.name == jewelry.name})!.size
        for (index, item) in knapsackItens.enumerated() {
            item.position = itemSlot[index]
        }
        addTextCount()
    }
    
    func calculateValues() -> (Int, Int, Int){
    
        var weight : Int = 0
        let quantity : Int = knapsackItens.count
        var amount : Int = 0
        
        knapsackItens.forEach { jewelry in
            weight += jewelry.weight
            amount += jewelry.value
        }
        return (weight, quantity, amount)
    }
    
    func addTextCount() {
        let font: String = "American Typewriter"
        let jewelryTitle = SKLabelNode(fontNamed: font)
        let capacity = SKLabelNode(fontNamed: font)
        let quantity = SKLabelNode(fontNamed: font)
        let amount = SKLabelNode(fontNamed: font)
        let (capacityValue, quantityValue, amountValue) = calculateValues()
        
        jewelryTitle.text = "Jewelry in knapsack:"
        jewelryTitle.name = "label"
        jewelryTitle.fontSize = 30
        jewelryTitle.fontColor = SKColor.darkGray
        jewelryTitle.position = CGPoint(x: frame.midX + 200, y: frame.midY - 150)
        
        capacity.text = "Capacity of knapsack: \(capacityValue)"
        capacity.fontSize = 25
        capacity.name = "label"
        capacity.fontColor = SKColor.darkGray
        capacity.position = CGPoint(x: jewelryTitle.position.x, y: jewelryTitle.position.y - 30)
        
        quantity.text = "Number of jewelry: \(quantityValue)"
        quantity.fontSize = 25
        quantity.name = "label"
        quantity.fontColor = SKColor.darkGray
        quantity.position = CGPoint(x: jewelryTitle.position.x, y: jewelryTitle.position.y - 60)
        
        amount.text = "Accumulated amount: \(amountValue)"
        amount.fontSize = 25
        amount.name = "label"
        amount.fontColor = SKColor.darkGray
        amount.position = CGPoint(x: jewelryTitle.position.x, y: jewelryTitle.position.y - 90)
        print(amount.position)
        
        addSpriteButton(position: CGPoint(x: jewelryTitle.position.x, y: jewelryTitle.position.y - 200))
        
        
        for child in self.children {
            
            if child.name == "label"{
                child.removeFromParent()
            }
        }
        addChild(jewelryTitle)
        addChild(capacity)
        addChild(quantity)
        addChild(amount)
    }
    
    func calculateResults() {
        
        let (capacityValue, _ , amountValue) = calculateValues()
        
        if (capacityValue > 40) {
            self.view!.presentScene(HeavyScene(size: CGSize(width: 1024, height: 768)), transition: SKTransition.moveIn(with: .right, duration: 1))
        }
        if (amountValue < 60 && capacityValue <= 40) {
            self.view!.presentScene(LightScene(size: CGSize(width: 1024, height: 768)), transition: SKTransition.moveIn(with: .right, duration: 1))
        }
        if (amountValue == 60 && capacityValue <= 40) {
            self.view!.presentScene(PerfectScene(size: CGSize(width: 1024, height: 768)), transition: SKTransition.moveIn(with: .right, duration: 1))
        }
    }
}


