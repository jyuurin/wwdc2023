//
//  5ArtistKnapsackProblem.swift
//  
//
//  Created by Julia Mendes on 17/04/23.
//

import Foundation
import SpriteKit

class ArtistKnapsackProblemScene: SKScene {
    
    var background = SKSpriteNode(imageNamed: "bg1")
    var character = SKSpriteNode(imageNamed: "thinking")
    var knapsack = SKSpriteNode(imageNamed: "knapsack-closed")
    var textbox = SKSpriteNode(imageNamed: "textbox-big")
    var textLabel = Label.textArtistsKnapsackProblemScene
    var myJewelrys = [SKSpriteNode(imageNamed: "earrings"),
                    SKSpriteNode(imageNamed: "keychain"),
                    SKSpriteNode(imageNamed: "bracelet"),
                    SKSpriteNode(imageNamed: "necklace")
    ]
    
    override func sceneDidLoad() {
        
        addBackground(bgname: "bg1")
        addSpriteKnapsack(knapsack: knapsack, knapsackName: "knapsack-closed")
        addSpriteJewelrys(jewelrys: myJewelrys, jewelrysName: "myJewelrys")
        addTextBox(item: textbox, itemName: "textbox")
        addSpriteCharacter(character: character, characterName: "thinking")
        addTextLabel(textClass: textLabel, position: CGPoint(x: frame.minX + 200, y: frame.midY - 50), maxLayout: 310)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view!.presentScene(WeightValueScene(size: CGSize(width: 1024, height: 768)), transition: SKTransition.fade(withDuration: 1))
    }
}

extension ArtistKnapsackProblemScene {
    
    func addBackground(bgname: String) {
        let background = SKSpriteNode(imageNamed: bgname)
        background.position = CGPoint(x: frame.midX , y: frame.midY + 50)
        background.size = CGSize(width: frame.size.width, height: frame.size.height * 1.2)
        
        addChild(background)
    }
    
    func addSpriteKnapsack(knapsack: SKSpriteNode, knapsackName: String) {
        knapsack.size = CGSize(width: 500, height: 500)
        knapsack.position = CGPoint(x: frame.maxX - 200, y: frame.minY + 250)
        knapsack.name = knapsackName
        knapsack.physicsBody?.affectedByGravity = false
        knapsack.physicsBody?.allowsRotation = false
        knapsack.physicsBody?.isDynamic = true
        
        addChild(knapsack)
    }
    func addSpriteCharacter(character: SKSpriteNode, characterName: String) {
        character.size = CGSize(width: 350, height: 350)
        character.position = CGPoint(x: frame.minX + 150, y: frame.minY + 160)
        character.name = characterName
        character.physicsBody?.affectedByGravity = false
        character.physicsBody?.allowsRotation = false
        character.physicsBody?.isDynamic = true
        
        addChild(character)
    }
    
    func addSpriteJewelrys(jewelrys: [SKSpriteNode], jewelrysName: String) {
        jewelrys[0].size = CGSize(width: 300, height: 300)
        jewelrys[0].position = CGPoint(x: frame.midX + 170, y: frame.midY + 200)
        jewelrys[0].name = jewelrysName
        jewelrys[0].physicsBody?.affectedByGravity = false
        jewelrys[0].physicsBody?.allowsRotation = false
        jewelrys[0].physicsBody?.isDynamic = true
        
        jewelrys[1].size = CGSize(width: 300, height: 300)
        jewelrys[1].position = CGPoint(x: frame.midX - 30, y: frame.midY + 100)
        jewelrys[1].name = jewelrysName
        jewelrys[1].physicsBody?.affectedByGravity = false
        jewelrys[1].physicsBody?.allowsRotation = false
        jewelrys[1].physicsBody?.isDynamic = true
        
        jewelrys[2].size = CGSize(width: 300, height: 300)
        jewelrys[2].position = CGPoint(x: frame.maxX - 150, y: frame.maxY - 200)
        jewelrys[2].name = jewelrysName
        jewelrys[2].physicsBody?.affectedByGravity = false
        jewelrys[2].physicsBody?.allowsRotation = false
        jewelrys[2].physicsBody?.isDynamic = true
        
        jewelrys[3].size = CGSize(width: 300, height: 300)
        jewelrys[3].position = CGPoint(x: frame.midX, y: frame.minY + 200)
        jewelrys[3].name = jewelrysName
        jewelrys[3].physicsBody?.affectedByGravity = false
        jewelrys[3].physicsBody?.allowsRotation = false
        jewelrys[3].physicsBody?.isDynamic = true
        
        
        addChild(jewelrys[0])
        addChild(jewelrys[1])
        addChild(jewelrys[2])
        addChild(jewelrys[3])
    }
    
    func addTextBox(item: SKSpriteNode, itemName: String) {
        item.size = CGSize(width: 350, height: 550)
        item.position = CGPoint(x: frame.minX + 200, y: frame.midY)
        item.name = itemName
        item.physicsBody?.affectedByGravity = false
        item.physicsBody?.allowsRotation = false
        item.physicsBody?.isDynamic = true
        
        addChild(item)
    }
    
    func addTextLabel(textClass: String, position: CGPoint, maxLayout: Int) {
        let font: String = "American Typewriter"
        let textlbl = SKLabelNode(fontNamed: font)
        let textJewelry = [SKLabelNode(fontNamed: font),
                       SKLabelNode(fontNamed: font),
                       SKLabelNode(fontNamed: font),
                       SKLabelNode(fontNamed: font)
        ]
        
        textlbl.text = textClass
        textlbl.name = "label"
        textlbl.position = position
        textlbl.fontSize = 30
        textlbl.fontColor = SKColor.darkGray
        textlbl.numberOfLines = 0
        textlbl.lineBreakMode = .byWordWrapping
        textlbl.preferredMaxLayoutWidth = CGFloat(maxLayout)
        
        textJewelry[0].text = "Necklace: 40units - 30$"
        textJewelry[1].text = "Keychain: 30units - 20$"
        textJewelry[2].text = "Earrings: 10units - 20$"
        textJewelry[3].text = "Bracelet: 20units - 40$"
        textJewelry[0].position = CGPoint(x: frame.midX - 50, y: frame.minY + 30)
        textJewelry[1].position = CGPoint(x: frame.midX + 60, y: frame.midX - 130)
        textJewelry[2].position = CGPoint(x: frame.midX, y: frame.maxY - 140)
        textJewelry[3].position = CGPoint(x: frame.maxX - 150, y: frame.maxY - 90)
        
        textJewelry[0].lineBreakMode = .byWordWrapping
        textJewelry[1].lineBreakMode = .byWordWrapping
        textJewelry[2].lineBreakMode = .byWordWrapping
        textJewelry[3].lineBreakMode = .byWordWrapping
        textJewelry[0].fontColor = SKColor.darkGray
        textJewelry[1].fontColor = SKColor.darkGray
        textJewelry[2].fontColor = SKColor.darkGray
        textJewelry[3].fontColor = SKColor.darkGray
        textJewelry[0].fontSize = 25
        textJewelry[1].fontSize = 25
        textJewelry[2].fontSize = 25
        textJewelry[3].fontSize = 25
        textJewelry[0].numberOfLines = 0
        textJewelry[1].numberOfLines = 0
        textJewelry[2].numberOfLines = 0
        textJewelry[3].numberOfLines = 0
        textJewelry[0].preferredMaxLayoutWidth = 200
        textJewelry[1].preferredMaxLayoutWidth = 200
        textJewelry[2].preferredMaxLayoutWidth = 200
        textJewelry[3].preferredMaxLayoutWidth = 200
        
        for child in self.children {
            if child.name == "label"{
                child.removeFromParent()
            }
        }
        addChild(textlbl)
        addChild(textJewelry[0])
        addChild(textJewelry[1])
        addChild(textJewelry[2])
        addChild(textJewelry[3])
    }
}
