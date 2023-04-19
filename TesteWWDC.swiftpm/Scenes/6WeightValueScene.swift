//
//  6WeightValue.swift
//  
//
//  Created by Julia Mendes on 17/04/23.
//

import Foundation
import SpriteKit

class WeightValueScene: SKScene {
    
    var textbox = SKSpriteNode(imageNamed: "textbox-small")
    var textLabel = Label.textWeightValueScene
    var character = [SKSpriteNode(imageNamed: "thinking"),
                     SKSpriteNode(imageNamed: "heavy"),
                     SKSpriteNode(imageNamed: "light"),
                     SKSpriteNode(imageNamed: "perfect"),
    ]
    
    override func sceneDidLoad() {
        
        addBackground(bgname: "bg1")
        addTextBox(item: textbox, itemName: "textbox")
        addSpriteCharacter(character: character, characterName: "results")
        addTextLabel(textClass: textLabel, position: CGPoint(x: frame.midX + 100, y: frame.minY + 70), maxLayout: 600)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view!.presentScene(LetsGoScene(size: CGSize(width: 1024, height: 768)), transition: SKTransition.fade(withDuration: 1))
        
    }
}

extension WeightValueScene {
    
    func addBackground(bgname: String) {
        let background = SKSpriteNode(imageNamed: bgname)
        background.position = CGPoint(x: frame.midX , y: frame.midY + 50)
        background.size = CGSize(width: frame.size.width, height: frame.size.height * 1.2)
        
        addChild(background)
    }
    
    func addSpriteCharacter(character: [SKSpriteNode], characterName: String) {
        //thiking
        character[0].size = CGSize(width: 350, height: 350)
        character[0].position = CGPoint(x: frame.minX + 150, y: frame.minY + 160)
        character[0].name = characterName
        character[0].physicsBody?.affectedByGravity = false
        character[0].physicsBody?.allowsRotation = false
        character[0].physicsBody?.isDynamic = true
        
        //heavy
        character[1].size = CGSize(width: 350, height: 350)
        character[1].position = CGPoint(x: frame.minX + 200, y: frame.midY + 100)
        character[1].name = characterName
        character[1].physicsBody?.affectedByGravity = false
        character[1].physicsBody?.allowsRotation = false
        character[1].physicsBody?.isDynamic = true
        
        //light
        character[2].size = CGSize(width: 350, height: 350)
        character[2].position = CGPoint(x: frame.midX, y: frame.midY + 100)
        character[2].name = characterName
        character[2].physicsBody?.affectedByGravity = false
        character[2].physicsBody?.allowsRotation = false
        character[2].physicsBody?.isDynamic = true
        
        //perfect
        character[3].size = CGSize(width: 350, height: 350)
        character[3].position = CGPoint(x: frame.maxX - 200, y: frame.midY + 100)
        character[3].name = characterName
        character[3].physicsBody?.affectedByGravity = false
        character[3].physicsBody?.allowsRotation = false
        character[3].physicsBody?.isDynamic = true
        
        addChild(character[0])
        addChild(character[1])
        addChild(character[2])
        addChild(character[3])
    }
    
    func addTextBox(item: SKSpriteNode, itemName: String) {
        item.size = CGSize(width: 1000, height: 800)
        item.position = CGPoint(x: frame.midX, y: frame.midY)
        item.name = itemName
        item.physicsBody?.affectedByGravity = false
        item.physicsBody?.allowsRotation = false
        item.physicsBody?.isDynamic = true
        
        addChild(item)
    }
    
    func addTextLabel(textClass: String, position: CGPoint, maxLayout: Int) {
        let font: String = "American Typewriter"
        let textlbl = SKLabelNode(fontNamed: font)
        
        textlbl.text = textClass
        textlbl.name = "label"
        textlbl.position = position
        textlbl.fontSize = 30
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
