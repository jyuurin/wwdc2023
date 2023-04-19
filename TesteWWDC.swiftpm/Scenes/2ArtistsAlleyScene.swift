//
//  2ArtistsAlleyScene.swift
//  
//
//  Created by Julia Mendes on 17/04/23.
//

import Foundation
import SpriteKit

class ArtistsAlleyScene: SKScene {
    
    
    var character = SKSpriteNode(imageNamed: "attention")
    var textBox = SKSpriteNode(imageNamed: "textbox-small")
    var textLabel = Label.textArtistsAlleyScene
    var products = [SKSpriteNode(imageNamed: "artists-poster"),
                    SKSpriteNode(imageNamed: "artists-keychain"),
                    SKSpriteNode(imageNamed: "artists-notes"),
                    SKSpriteNode(imageNamed: "artists-botton")
    ]
    
    override func sceneDidLoad() {
        
        addBackground(bgname: "bg1")
        addTextBox(item: textBox, itemName: "textbox")
        addTextLabel(textClass: textLabel, position: CGPoint(x: 630, y: 45), maxLayout: 700)
        addSpriteCharacter(character: character, characterName: "attention")
        addSpriteProduct(products: products, productName: "artists-product")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view!.presentScene(HandmadeJewelryScene(size: CGSize(width: 1024, height: 768)), transition: SKTransition.fade(withDuration: 1))
    }
}

extension ArtistsAlleyScene {
    
    func addBackground(bgname: String) {
        let background = SKSpriteNode(imageNamed: bgname)
        background.position = CGPoint(x: frame.midX , y: frame.midY + 50)
        background.size = CGSize(width: frame.size.width, height: frame.size.height * 1.2)
        
        addChild(background)
    }
    
    func addSpriteCharacter(character: SKSpriteNode, characterName: String) {
        character.size = CGSize(width: 400, height: 400)
        character.position = CGPoint(x: frame.minX + 150, y: frame.minY + 160)
        character.name = characterName
        character.physicsBody?.affectedByGravity = false
        character.physicsBody?.allowsRotation = false
        character.physicsBody?.isDynamic = true
        
        addChild(character)
    }
    
    func addSpriteProduct(products: [SKSpriteNode], productName: String) {
        products[0].size = CGSize(width: 500, height: 500)
        products[0].position = CGPoint(x: frame.minX + 160, y: frame.midY + 130)
        products[0].name = productName
        products[0].physicsBody?.affectedByGravity = false
        products[0].physicsBody?.allowsRotation = false
        products[0].physicsBody?.isDynamic = true
        
        products[1].size = CGSize(width: 500, height: 500)
        products[1].position = CGPoint(x: frame.midX - 40, y: frame.midY + 50)
        products[1].name = productName
        products[1].physicsBody?.affectedByGravity = false
        products[1].physicsBody?.allowsRotation = false
        products[1].physicsBody?.isDynamic = true
        
        products[2].size = CGSize(width: 500, height: 500)
        products[2].position = CGPoint(x: frame.midX + 170, y: frame.midY + 100)
        products[2].name = productName
        products[2].physicsBody?.affectedByGravity = false
        products[2].physicsBody?.allowsRotation = false
        products[2].physicsBody?.isDynamic = true
        
        products[3].size = CGSize(width: 500, height: 500)
        products[3].position = CGPoint(x: frame.midX + 370, y: frame.midY + 150)
        products[3].name = productName
        products[3].physicsBody?.affectedByGravity = false
        products[3].physicsBody?.allowsRotation = false
        products[3].physicsBody?.isDynamic = true
        
        
        addChild(products[0])
        addChild(products[1])
        addChild(products[2])
        addChild(products[3])
    }

    func addTextBox(item: SKSpriteNode, itemName: String) {
        item.size = CGSize(width: 1000, height: 800)
        item.position = CGPoint(x: frame.midX + 10, y: frame.midY)
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
