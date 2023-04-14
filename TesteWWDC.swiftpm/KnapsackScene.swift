//
//  DragNDrop.swift
//  TesteWWDC
//
//  Created by Julia Mendes on 11/04/23.
//

import Foundation
import SpriteKit


class KnapsackScene: SKScene, SKPhysicsContactDelegate {
    
    var knapsack = SKSpriteNode(color: .darkGray, size: CGSize(width: 200.0, height: 200.0))
    var jewelryList : [Jewelry] = Jewelry.jewelryList()
    private var currentNode: SKNode?
    
    
    override func didMove(to view: SKView) {
        self.physicsWorld.contactDelegate = self
        backgroundColor = .brown
        //fazer a cena
        jewelryList.forEach(addJewelry)
        
        addKnapsack(knapsack: knapsack, knapsackName: "mochila")
        print(knapsack.name!)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let location = touch.location(in: self)
            
            let touchedNodes = self.nodes(at: location)
            for node in touchedNodes.reversed() {
                if (node.name == "brinco" || node.name == "pulseira" || node.name == "chaveiro" || node.name == "colar") {
                    self.currentNode = node
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
        self.currentNode = nil
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.currentNode = nil
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
//        let contactJewelryName = contact.bodyA.node?.name
//        let contactKnapsackName = contact.bodyB.node?.name
//
//        if (contactJewelryName == "")
        
       
    }
}


