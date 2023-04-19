//
//  1WelcomeScene.swift
//  
//
//  Created by Julia Mendes on 17/04/23.
//

import Foundation
import SpriteKit

class WelcomeScene: SKScene {
    
    var character = SKSpriteNode(imageNamed: "hello")
    var textBox = SKSpriteNode(imageNamed: "textbox-big")
    var textLabel = Label.textWelcomeScene
    
    override func sceneDidLoad() {
        
        addBackground(bgname: "bg1")
        addSpriteCharacter(character: character, characterName: "hello")
        addTextBox(item: textBox, itemName: "textbox")
        addTextLabel(textClass: textLabel, position: CGPoint(x: frame.midX - 230, y: frame.midY - 100))
        
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view!.presentScene(ArtistsAlleyScene(size: CGSize(width: 1024, height: 768)), transition: SKTransition.fade(withDuration: 1))
    }
}

extension WelcomeScene {
    
    func addBackground(bgname: String) {
        let background = SKSpriteNode(imageNamed: bgname)
        background.position = CGPoint(x: frame.midX , y: frame.midY + 50)
        background.size = CGSize(width: frame.size.width, height: frame.size.height * 1.2)
        
        addChild(background)
    }
    
    
    func addSpriteCharacter(character: SKSpriteNode, characterName: String) {
        character.size = CGSize(width: 800, height: 800)
        character.position = CGPoint(x: frame.midX + 270, y: frame.midY - 20)
        character.name = characterName
        character.physicsBody?.affectedByGravity = false
        character.physicsBody?.allowsRotation = false
        character.physicsBody?.isDynamic = true
        
        addChild(character)
    }
    
    func addTextBox(item: SKSpriteNode, itemName: String) {
        item.size = CGSize(width: 500, height: 800)
        item.position = CGPoint(x: frame.midX - 230, y: frame.midY - 20)
        item.name = itemName
        item.physicsBody?.affectedByGravity = false
        item.physicsBody?.allowsRotation = false
        item.physicsBody?.isDynamic = true
        
        addChild(item)
    }
    
    func addTextLabel(textClass: String, position: CGPoint) {
        let font: String = "American Typewriter"
        let textlbl = SKLabelNode(fontNamed: font)
        let textNext = SKLabelNode(fontNamed: font)
        
        textlbl.text = textClass
        textlbl.name = "label"
        textlbl.position = position
        textlbl.fontSize = 35
        textlbl.fontColor = SKColor.darkGray
        textlbl.numberOfLines = 0
        textlbl.lineBreakMode = .byWordWrapping
        textlbl.preferredMaxLayoutWidth = 390
        
        textNext.text = "Tap to continue."
        textNext.fontSize = 25
        textNext.fontColor = SKColor.darkGray
        textNext.position = CGPoint(x: textlbl.position.x, y: frame.minY + 70)
        
        for child in self.children {
            if child.name == "label"{
                child.removeFromParent()
            }
        }
        addChild(textlbl)
        addChild(textNext)
    }
    
}



