//
//  8Tutorial.swift
//  
//
//  Created by Julia Mendes on 17/04/23.
//

import Foundation
import SpriteKit

class TutorialScene: SKScene {
    
    var textbox = SKSpriteNode(imageNamed: "textbox-big")
    var textLabel = Label.textTutorialScene
    
    override func sceneDidLoad() {
        
        addBackground(bgname: "bg1")
        addTextBox(item: textbox, itemName: "textbox")
        addTextLabel(textClass: textLabel, position: CGPoint(x: frame.midX, y: frame.minY + 150), maxLayout: 800, fontSize: 35)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view!.presentScene(KnapsackScene(size: CGSize(width: 1024, height: 768)), transition: SKTransition.moveIn(with: .right, duration: 1))
    }
}

extension TutorialScene {
    func addBackground(bgname: String) {
        let background = SKSpriteNode(imageNamed: bgname)
        background.position = CGPoint(x: frame.midX , y: frame.midY + 50)
        background.size = CGSize(width: frame.size.width, height: frame.size.height * 1.2)
        
        addChild(background)
    }
    
    func addTextBox(item: SKSpriteNode, itemName: String) {
        item.size = CGSize(width: frame.width, height: frame.height)
        item.position = CGPoint(x: frame.midX, y: frame.midY - 20)
        item.name = itemName
        item.physicsBody?.affectedByGravity = false
        item.physicsBody?.allowsRotation = false
        item.physicsBody?.isDynamic = true
        
        addChild(item)
    }
    
    func addTextLabel(textClass: String, position: CGPoint, maxLayout: Int, fontSize: Int) {
        let font: String = "American Typewriter"
        let textTittle = SKLabelNode(fontNamed: font)
        let textlbl = SKLabelNode(fontNamed: font)
        
        textTittle.text = "Tutorial"
        textTittle.position = CGPoint(x: frame.midX, y: frame.maxY - 120)
        textTittle.fontSize = 60
        textlbl.text = textClass
        textlbl.name = "label"
        textlbl.position = position
        textlbl.fontSize = CGFloat(fontSize)
        textlbl.fontColor = SKColor.darkGray
        textlbl.numberOfLines = 0
        textlbl.lineBreakMode = .byWordWrapping
        textlbl.preferredMaxLayoutWidth = CGFloat(maxLayout)
        
        for child in self.children {
            if child.name == "label"{
                child.removeFromParent()
            }
        }
        addChild(textTittle)
        addChild(textlbl)
    }
    
}
