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
            if game.matchSuccess == 1 {
                nameGrayCheckerClone()
            }
        }
        updateViewFromModel()
    }
    
    @IBAction func deselect(_ sender: UIButton) {
        // print("deselect")
        game.deselect()
        updateViewFromModel()
    }
    
    var destructiveCardIndex = [Int]()
    
    @IBAction func touchCardDraw(_ sender: UIButton) {
        // print("drawing cards")
        // Functions Used
        func arrayMatchedReplace() -> Bool {
            if destructiveCardIndex.count > 0 {
                for index in cardButtons.indices {
                    let cardBoardArrayValue = cardBoardArray[index]
                    if cardBoardArrayValue > -1 {
                        if game.cards[cardBoardArrayValue].isMatched {
                            let destructiveValue = destructiveCardIndex.removeFirst()
                            cardBoardArray[index] = destructiveValue
                            game.cards[cardBoardArray[index]].isFaceUp = true
                            return true
                        }
                    }
                }
            }
            return false
        }
        
        func arrayEmptyFill() -> Bool {
            if destructiveCardIndex.count > 0 {
                for index in cardButtons.indices {
                    let cardBoardArrayValue = cardBoardArray[index]
                    if cardBoardArrayValue == -1 {
                        cardBoardArray[index] = destructiveCardIndex.removeFirst()
                        game.cards[cardBoardArray[index]].isFaceUp = true
                        return true
                    }
                }
            }
            return false
        }
        
        func arrayMatchedReplaceChecker() -> Bool {
            if destructiveCardIndex.count > 0 {
                for index in cardButtons.indices {
                    let cardBoardArrayValue = cardBoardArray[index]
                    if cardBoardArrayValue > -1 {
                        if game.cards[cardBoardArrayValue].isMatched {
                            // let destructiveValue = destructiveCardIndex.removeFirst()
                            // cardBoardArray[index] = destructiveValue
                            // game.cards[cardBoardArray[index]].isFaceUp = true
                            return true
                        }
                    }
                }
            }
            return false
        }
        
        func arrayEmptyFillChecker() -> Bool {
            if destructiveCardIndex.count > 0 {
                for index in cardButtons.indices {
                    let cardBoardArrayValue = cardBoardArray[index]
                    if cardBoardArrayValue == -1 {
                        // cardBoardArray[index] = destructiveCardIndex.removeFirst()
                        // game.cards[cardBoardArray[index]].isFaceUp = true
                        return true
                    }
                }
            }
            return false
        }
        
        func nameGrayChecker() {
            if !arrayMatchedReplaceChecker(), !arrayEmptyFillChecker() {
                let button = touchCardDraw
                let color = UIColor.gray.withAlphaComponent(0.5)
                
                let attributes: [NSAttributedString.Key:Any] = [
                    .strokeColor : color,
                    .foregroundColor: color,
                    .strokeWidth: -1
                ]
                
                let attributedString = NSAttributedString(string: "Deal 3 More Cards", attributes: attributes)
                
                button?.setAttributedTitle(attributedString, for: UIControl.State.normal)
            } else {
                let button = touchCardDraw
                let color = UIColor.black
                
                let attributes: [NSAttributedString.Key:Any] = [
                    .strokeColor : color,
                    .foregroundColor: color,
                    .strokeWidth: -1
                ]
                
                let attributedString = NSAttributedString(string: "Deal 3 More Cards", attributes: attributes)
                
                button?.setAttributedTitle(attributedString, for: UIControl.State.normal)
            }
        }
        
        
        // running code
        for _ in 0..<3 {
            if arrayMatchedReplace() {
                //print("index was replaced")
            } else if arrayEmptyFill() {
                //print("index was filled")
            }
        }
        
        nameGrayChecker()
        
        // checks
        // print("cardBoardArray: \(cardBoardArray)")
        
        // updates
        updateViewFromModel()
    }
    
    func nameGrayCheckerClone() {
        let button = touchCardDraw
        let color = UIColor.black
        
        let attributes: [NSAttributedString.Key:Any] = [
            .strokeColor : color,
            .foregroundColor: color,
            .strokeWidth: -1
        ]
        
        let attributedString = NSAttributedString(string: "Deal 3 More Cards", attributes: attributes)
        
        button?.setAttributedTitle(attributedString, for: UIControl.State.normal)
    }
    
    @IBAction func newGameButton(_ sender: UIButton) {
        // game.startNewGame()
        // print("Starting a new game!")
        game = SetGame(numberOfTotalSlots: numberOfTotalSlots)
        cardBoardArrayInit()
        nameGrayCheckerClone()
        updateViewFromModel()
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
                    .strokeColor : color.withAlphaComponent(0.3),
                    .foregroundColor : color.withAlphaComponent(0.3),
                    .strokeWidth : -1
                ]
                return attributes
            } else {
                let attributes: [NSAttributedString.Key:Any] = [
                    .strokeColor : color,
                    .strokeWidth : shading,
                    .foregroundColor: color
                    
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
    
    var cardBoardArray = [Int]()
    
    func cardBoardArrayInit() {
        destructiveCardIndex = [Int]()
        cardBoardArray = [Int]()
        
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
//        print("destructiveCardIndex: \(destructiveCardIndex)")
//        print("cardBoardArray = \(cardBoardArray)")
//        print("cards.count = \(game.cards.count)")
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
            let cardBoardValue = cardBoardArray[index]
            let button = cardButtons[index]
            var card = game.cards[index]
            
            if cardBoardValue > -1 {
                card = game.cards[cardBoardValue]
            }
            
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
        scoreLabel.text = "Score: \(game.score)"
    }
    
    // debugging
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cardBoardArrayInit()
        updateViewFromModel()
    }
}

extension String {
    var NSAttributor: NSAttributedString {
        let attributes: [NSAttributedString.Key:Any] = [
            .strokeColor : UIColor.black,
            .foregroundColor : UIColor.black,
            .strokeWidth : -1
        ]
        return NSAttributedString(string: self, attributes: attributes)
    }
}

//let attributes: [NSAttributedString.Key:Any] = [
//    .strokeColor : color.withAlphaComponent(0.3),
//    .foregroundColor : color.withAlphaComponent(0.3),
//    .strokeWidth : -1
//]

//extension Int {
//    var arc4random: Int {
//        if self > 0 {
//            return Int(arc4random_uniform(UInt32(self)))
//        } else if self < 0 {
//            return -Int(arc4random_uniform(UInt32(abs(self))))
//        } else {
//            return 0
//        }
//    }
//}
