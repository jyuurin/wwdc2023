//
//  10HeavyScene.swift
//  
//
//  Created by Julia Mendes on 17/04/23.
//

import Foundation
import SpriteKit

class HeavyScene: SKScene {
    
    var textbox = SKSpriteNode(imageNamed: "textbox-big")
    var character = SKSpriteNode(imageNamed: "heavy")
    var textLabel = Label.textHeavyScene
    
    override func sceneDidLoad() {
        
        addBackground(bgname: "bg1")

        print("pesado!!")
        
        
        addTextBox(item: textbox, itemName: "textbox")
        addSpriteCharacter(character: character, characterName: "heavy")
        addSpriteButton(spriteName: "button-retry", position: CGPoint(x: frame.midX - 200, y: frame.minY + 100), buttonName: "retry")
        addSpriteButton(spriteName: "button-about", position: CGPoint(x: frame.midX + 200, y: frame.minY + 100 ), buttonName: "about")
        addTextLabel(textClass: textLabel, position: CGPoint(x: frame.midX, y: frame.midY - 200), maxLayout: 700, fontSize: 30)
        
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let location = touch.location(in: self)
            
            let touchedNodes = self.nodes(at: location)
            for node in touchedNodes.reversed() {
                if (node.name == "retry") {
                    self.view!.presentScene(KnapsackScene(size: CGSize(width: 1024, height: 768)), transition: SKTransition.fade(withDuration: 1))
                }
                else if (node.name == "about") {
                    self.view!.presentScene(ExplicationScene(size: CGSize(width: 1024, height: 768)), transition: SKTransition.moveIn(with: .right, duration: 1))
                }
            }
        }
    }
}

extension HeavyScene {
    
    func addBackground(bgname: String) {
        let background = SKSpriteNode(imageNamed: bgname)
        background.position = CGPoint(x: frame.midX , y: frame.midY + 50)
        background.size = CGSize(width: frame.size.width, height: frame.size.height * 1.2)
        
        addChild(background)
    }
    
    func addSpriteButton(spriteName: String, position: CGPoint, buttonName: String) {
        let buttonSprite = SKSpriteNode(imageNamed: spriteName)
        buttonSprite.position = position
        buttonSprite.size = CGSize(width: 400, height: 400)
        buttonSprite.name = buttonName
        buttonSprite.physicsBody?.affectedByGravity = false
        buttonSprite.physicsBody?.allowsRotation = false
        buttonSprite.physicsBody?.isDynamic = true
        
        addChild(buttonSprite)
    }
    
    func addTextBox(item: SKSpriteNode, itemName: String) {
        item.size = CGSize(width: 1000, height: 800)
        item.position = CGPoint(x: frame.midX, y: frame.midY - 20)
        item.name = itemName
        item.physicsBody?.affectedByGravity = false
        item.physicsBody?.allowsRotation = false
        item.physicsBody?.isDynamic = true
        
        addChild(item)
    }
    
    func addSpriteCharacter(character: SKSpriteNode, characterName: String) {
        character.size = CGSize(width: 400, height: 400)
        character.position = CGPoint(x: frame.midX, y: frame.maxY - 250)
        character.name = characterName
        character.physicsBody?.affectedByGravity = false
        character.physicsBody?.allowsRotation = false
        character.physicsBody?.isDynamic = true
        
        addChild(character)
    }
    
    func addTextLabel(textClass: String, position: CGPoint, maxLayout: Int, fontSize: Int) {
        let font: String = "American Typewriter"
        let textlbl = SKLabelNode(fontNamed: font)
        
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
        addChild(textlbl)
    }

}




