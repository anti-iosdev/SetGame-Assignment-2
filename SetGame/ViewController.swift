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
    
    @IBOutlet weak var touchCardDraw: UIButton!
    
    @IBAction func touchCard(_ sender: UIButton) {
        if let cardNumber = cardButtons.index(of: sender) {
            game.chooseCard(at: cardNumber)
        }
        updateViewFromModel()
    }
    
    var destructiveCardIndex = [Int]()
    
    @IBAction func touchCardDraw(_ sender: UIButton) {
        
        // check to see if any are matched
        for index in game.cards.indices {
            if game.cards[index].isMatched {
                print("card @: \(index) is matched")
            }
        }
        
        
        if destructiveCardIndex.count > 0 {
            for _ in 0..<3 {
                if cardBoardArrayUpdate(at: destructiveCardIndex.removeFirst()) {
                    print("cardBoardArray = \(cardBoardArray)")
                }
                updateViewFromModel()
            }
        } else {
            let attributes: [NSAttributedString.Key:Any] = [
                .strokeColor : UIColor.black,
                .backgroundColor: UIColor.darkGray.withAlphaComponent(0.5)
            ]
            let attributedString = NSAttributedString(string: "Deal 3 More Cards", attributes: attributes)
            //button.setAttributedTitle(cardTitle(for: card), for: UIControl.State.normal)

            touchCardDraw.setAttributedTitle(attributedString, for: UIControl.State.normal)
        }
        
        
        // MARK: Remove later
        //updateViewFromModel()
    }
    
    @IBAction func newGameButton(_ sender: UIButton) {
        //game.startNewGame()
        print("Start a new game!")
    }
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    
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
    
    var cardBoardArray = [Int]()
    
    func cardBoardArrayInit() {
        for index in game.cards.indices {
            destructiveCardIndex.append(index)
        }
        
        for index in cardButtons.indices {
            if index < 12 {
                cardBoardArray.append(destructiveCardIndex.removeFirst())
            } else {
                cardBoardArray.append(-1)
            }
        }
        //print("destructiveCardIndex: \()")
        //print("cardBoardArray = \(cardBoardArray)")
        // print("cards.count = \(game.cards.count)")
    }
    
    func cardBoardArrayUpdate(at newIndex: Int) -> Bool {
//        print("cardBoardArray: \(cardBoardArray)")
//        print("cards.indices: \(game.cards.indices)")
//        print("destructiveCardIndex: \(destructiveCardIndex)")
//        return true
                for index in cardBoardArray.indices {
                    // print("\(index)")
                    
                    if game.cards[index].isMatched == true {
                        cardBoardArray[index] = newIndex
                        game.cards[newIndex].isFaceUp = true
                        game.cards[newIndex].isMatched = false
                        print("\(index) was replaced with \(newIndex)")
                        return true
                    } else if cardBoardArray[index] == -1 {
                        print("void: index=\(index)")
                        game.cards[newIndex].isFaceUp = true
                        cardBoardArray[index] = newIndex
                        return true
                    }
                }
                return false
    }
    
    // MARK: updateViewFromModel
    func updateViewFromModel() {
        for index in cardButtons.indices {
            // let cardBoardValue = cardBoardArray[index]
            let button = cardButtons[index]
            let card = game.cards[index]
            
//            if cardBoardValue > -1 {
//                card = game.cards[cardBoardValue]
//            } else {
//                card = game.cards[index]
//            }

            // rounded corners
            button.layer.cornerRadius = 8.0
            
            if card.isSelected {
                button.layer.borderWidth = 3.0
                button.layer.borderColor = UIColor.blue.cgColor
            } else {
                button.layer.borderWidth = 0.0
            }
            
            if card.isFaceUp {
                //button.setTitle(String(index), for: UIControl.State.normal)
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
        
        cardBoardArrayInit()
        
        // game = SetGame(numberOfTotalSlots: numberOfTotalSlots)
        updateViewFromModel()
    }
}

