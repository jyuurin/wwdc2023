//
//  KnapsackScene.swift
//  TesteWWDC
//
//  Created by Julia Mendes on 11/04/23.
//

import Foundation
import SpriteKit


class KnapsackScene: SKScene {
    
    var knapsack = SKSpriteNode(imageNamed: "knapsack-open")
    var jewelryList : [Jewelry] = Jewelry.jewelryList()
    var knapsackItens : [Jewelry] = [Jewelry]()
    private var currentNode: SKNode?
    private var initialPosition: CGPoint?
    var itemSlot: [CGPoint] = [CGPoint]()
    
    override func didMove(to view: SKView) {
        
        addBackground(bgname: "bg1")
        jewelryList.forEach(addSpriteJewelry)
        addSpriteKnapsack(knapsack: knapsack, knapsackName: "mochila")
        print(knapsack.name!)

        addTextCount()
        itemSlot = [
            CGPoint(x: frame.midX, y: frame.midY - 30),
            CGPoint(x: frame.midX + 100, y: frame.midY - 30),
            CGPoint(x: frame.midX + 200, y: frame.midY - 30),
            CGPoint(x: frame.midX + 300, y: frame.midY - 30)
        ]

    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let location = touch.location(in: self)
            
            let touchedNodes = self.nodes(at: location)
            for node in touchedNodes.reversed() {
                if (node.name == "earrings" || node.name == "bracelet" || node.name == "keychain" || node.name == "necklace") {
                    if !knapsackItens.contains(node as! Jewelry){
                        self.currentNode = node
                        self.initialPosition = currentNode?.position
                    }
                    else {
                        removeJewelryKnapsack(jewelry: node as! Jewelry)
                    }
                }
                if (node.name == "button") {
                    calculateResults()
                }
            }
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first, let node = self.currentNode {
            let touchLocation = touch.location(in: self)
            node.position = touchLocation
            
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if let node = self.currentNode {
            if (CGRectIntersectsRect(node.frame, knapsack.frame)) {
                addJewelryKnapsack(jewelry: node as! Jewelry)
                
            }
            else {
                guard let iniPosition = initialPosition else {
                    return
                }
                node.position = iniPosition
                initialPosition = nil
            }
        }
        self.currentNode = nil
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.currentNode = nil
    }

}


