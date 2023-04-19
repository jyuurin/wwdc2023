//
//  3HandmadeJewelry.swift
//  
//
//  Created by Julia Mendes on 17/04/23.
//

import Foundation
import SpriteKit

class HandmadeJewelryScene: SKScene {
    
    var character = SKSpriteNode(imageNamed: "explication")
    var textLabel = Label.textHandmadeJewelryScene
    var myJewelrys = [SKSpriteNode(imageNamed: "earrings"),
                    SKSpriteNode(imageNamed: "keychain"),
                    SKSpriteNode(imageNamed: "bracelet"),
                    SKSpriteNode(imageNamed: "necklace")
    ]
    override func sceneDidLoad() {
        
        addBackground(bgname: "bg1")
        addSpriteJewelrys(jewelrys: myJewelrys, jewelrysName: "myJewelrys")
        addSpriteCharacter(character: character, characterName: "explication")
        addTextLabel(textClass: textLabel, position: CGPoint(x: frame.minX + 200, y: frame.maxY - 150), maxLayout: 270)
        
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view!.presentScene(MyKnapsackScene(size: CGSize(width: 1024, height: 768)), transition: SKTransition.fade(withDuration: 1))
    }
}

extension HandmadeJewelryScene {
    
    func addBackground(bgname: String) {
        let background = SKSpriteNode(imageNamed: bgname)
        background.position = CGPoint(x: frame.midX , y: frame.midY + 50)
        background.size = CGSize(width: frame.size.width, height: frame.size.height * 1.2)
        
        addChild(background)
    }
    
    func addSpriteCharacter(character: SKSpriteNode, characterName: String) {
        character.size = CGSize(width: 600, height: 600)
        character.position = CGPoint(x: frame.minX + 200, y: frame.midY - 100)
        character.name = characterName
        character.physicsBody?.affectedByGravity = false
        character.physicsBody?.allowsRotation = false
        character.physicsBody?.isDynamic = true
        
        addChild(character)
    }
    
    func addSpriteJewelrys(jewelrys: [SKSpriteNode], jewelrysName: String) {
        jewelrys[0].size = CGSize(width: 400, height: 400)
        jewelrys[0].position = CGPoint(x: frame.midX + 40, y: frame.midY + 200)
        jewelrys[0].name = jewelrysName
        jewelrys[0].physicsBody?.affectedByGravity = false
        jewelrys[0].physicsBody?.allowsRotation = false
        jewelrys[0].physicsBody?.isDynamic = true
        
        jewelrys[1].size = CGSize(width: 400, height: 400)
        jewelrys[1].position = CGPoint(x: frame.midX, y: frame.midY - 150)
        jewelrys[1].name = jewelrysName
        jewelrys[1].physicsBody?.affectedByGravity = false
        jewelrys[1].physicsBody?.allowsRotation = false
        jewelrys[1].physicsBody?.isDynamic = true
        
        jewelrys[2].size = CGSize(width: 400, height: 400)
        jewelrys[2].position = CGPoint(x: frame.maxX - 150, y: frame.maxY - 200)
        jewelrys[2].name = jewelrysName
        jewelrys[2].physicsBody?.affectedByGravity = false
        jewelrys[2].physicsBody?.allowsRotation = false
        jewelrys[2].physicsBody?.isDynamic = true
        
        jewelrys[3].size = CGSize(width: 400, height: 400)
        jewelrys[3].position = CGPoint(x: frame.maxX - 150, y: frame.minY + 200)
        jewelrys[3].name = jewelrysName
        jewelrys[3].physicsBody?.affectedByGravity = false
        jewelrys[3].physicsBody?.allowsRotation = false
        jewelrys[3].physicsBody?.isDynamic = true
        
        
        addChild(jewelrys[0])
        addChild(jewelrys[1])
        addChild(jewelrys[2])
        addChild(jewelrys[3])
    }
    
    func addTextLabel(textClass: String, position: CGPoint, maxLayout: Int) {
        let font: String = "American Typewriter"
        let textlbl = SKLabelNode(fontNamed: font)
        
        textlbl.text = textClass
        textlbl.name = "label"
        textlbl.position = position
        textlbl.fontSize = 40
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
