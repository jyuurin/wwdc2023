//
//  File.swift
//  
//
//  Created by Julia Mendes on 18/04/23.
//

import Foundation
import SpriteKit

class HomeScene: SKScene {
    
    override func sceneDidLoad() {
        
        addBackground(bgname: "bg1")
        addBackground(bgname: "app-tittle")
        addSpriteButton(position: CGPoint(x: frame.midX, y: frame.midY - 300))
        
        
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let location = touch.location(in: self)
            
            let touchedNodes = self.nodes(at: location)
            for node in touchedNodes.reversed() {
                if (node.name == "start") {
                    self.view!.presentScene(WelcomeScene(size: CGSize(width: 1024, height: 768)), transition: SKTransition.fade(withDuration: 2))
                }
            }
        }
    }
}

extension HomeScene {
    
    func addBackground(bgname: String) {
        let background = SKSpriteNode(imageNamed: bgname)
        background.position = CGPoint(x: frame.midX , y: frame.midY + 50)
        background.size = CGSize(width: frame.size.width, height: frame.size.height * 1.2)
        
        addChild(background)
    }
    
    func addSpriteButton(position: CGPoint) {
        let buttonSprite = SKSpriteNode(imageNamed: "button-start")
        buttonSprite.position = position
        buttonSprite.size = CGSize(width: frame.size.width / 1.5, height: frame.size.height / 1.2)
        buttonSprite.name = "start"
        buttonSprite.physicsBody?.affectedByGravity = false
        buttonSprite.physicsBody?.allowsRotation = false
        buttonSprite.physicsBody?.isDynamic = true
        
        
        addChild(buttonSprite)
    }
}
