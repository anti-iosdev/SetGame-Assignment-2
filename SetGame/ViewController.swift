//
//  ViewController.swift
//  SetGame
//
//  Created by Anti on 9/23/18.
//  Copyright © 2018 Anti. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // initial initializers
    lazy var game = SetGame(numberOfTotalSlots: numberOfTotalSlots)
    
    var numberOfTotalSlots: Int {
        return cardButtons.count
    }
    
    // var deck = cardDeck()
    
    // Button Code
    @IBOutlet var cardButtons: [UIButton]!
    
    @IBAction func touchCard(_ sender: UIButton) {
        //print("this is a card")
        if let cardNumber = cardButtons.index(of: sender) {
            game.chooseCard(at: cardNumber)
            //print("a card has been chosen")
        }
        updateViewFromModel()
    }
    
    
    
    
    // string for card back
    func cardTitle(for card: Card) -> NSAttributedString {
        let number = card.number.result
        let symbol = card.symbol.result
        //let color = card.color.result
        let shading = card.shading.result
        
        func attributeHelper(shading: Int) -> [NSAttributedString.Key:Any] {
            let color = card.color.result
            if shading == 15 {
                // color = color.withAlphaComponent(0.1)
                let attributes: [NSAttributedString.Key:Any] = [
                    .strokeColor : color.withAlphaComponent(0.15),
                    .foregroundColor : color.withAlphaComponent(0.15),
                    .strokeWidth : -1
                ]
                return attributes
            } else {
                let attributes: [NSAttributedString.Key:Any] = [
                    .strokeColor : color,
                    .strokeWidth : shading
                ]
                return attributes
            }
        }
        
        let attributedString = NSAttributedString(string: symbol, attributes: attributeHelper(shading: shading))
        
        let totalString = NSMutableAttributedString()
        let totalStringNewLine = NSAttributedString(string: "\n")
        
        for index in 0..<number {
            totalString.append(attributedString)
            
            if index + 1 != number {
            totalString.append(totalStringNewLine)
            }
        }
        return totalString
    }
    
    func setGameNewGame() {

    }
    
    // UpdateView
    func updateViewFromModel() {
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]

            
            // rounded corners
            button.layer.cornerRadius = 8.0
            
            if card.isSelected {
                button.layer.borderWidth = 3.0
                button.layer.borderColor = UIColor.blue.cgColor
            } else {
                button.layer.borderWidth = 0.0
            }
            
            if card.isFaceUp {
                button.setAttributedTitle(cardTitle(for: card), for: UIControl.State.normal)
            } else {
                button.setAttributedTitle(NSAttributedString(string: ""), for: UIControl.State.normal)
            }
            
            if game.uglyColorSolution == 1 {
                button.layer.borderColor = UIColor.green.cgColor
            } else if game.uglyColorSolution == 2 {
                button.layer.borderColor = UIColor.red.cgColor
            }
        }
    }
    
    // debugging
    override func viewDidLoad() {
        super.viewDidLoad()
        // game = SetGame(numberOfTotalSlots: numberOfTotalSlots)
        updateViewFromModel()
    }
}

