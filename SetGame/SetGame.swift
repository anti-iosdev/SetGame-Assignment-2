//
//  SetGame.swift
//  SetGame
//
//  Created by Anti on 9/24/18.
//  Copyright © 2018 Anti. All rights reserved.
//

import Foundation

class SetGame
{
    var deck = cardDeck()
    var cards = [Card]()
    
    var activeIndices: [Int]?
//    {
//        get {
//            var foundIndex = [Int]()
//            for index in cards.indices {
//                if cards[index].isSelected {
//                    foundIndex.append(index)
//                } else {
//                    return nil
//                }
//            }
//            return foundIndex
//        }
//    }
    
    var uglyColorSolution = 0
    
    func chooseCard(at index: Int) {
        // simpleFlip(at: index)
        uglyColorSolution = 0
        if cards[index].isFaceUp {
            if let matchIndex = activeIndices, !matchIndex.contains(index) {
                if matchIndex.count < 2 {
                    activeIndices!.append(index)
                    cards[index].isSelected = true
                } else {
                    // check for matching here
                    // print("activeIndices = \(String(describing: activeIndices)), index = \(index)")
                    activeIndices!.append(index)
                    
                    for index in activeIndices ?? [] {
                        cards[index].isMatched = true
                        uglyColorSolution = 2
                    }
                    
                    // reset
                    activeIndices = nil
                    cards[index].isSelected = true
                }
            } else if activeIndices == nil {
                activeIndices = [index]
                for index in cards.indices {
                    cards[index].isSelected = false
                }
                cards[index].isSelected = true
            }
        }
    }
    
    func selectionBot (at index: Int) {
        cards[index].isFaceUp ? (cards[index].isSelected = true) : (cards[index].isSelected = false)
    }
    
    func simpleFlip(at index: Int) {
        cards[index].isFaceUp ? (cards[index].isFaceUp = false) : (cards[index].isFaceUp = true)
    }
    
    init(numberOfTotalSlots: Int) {
        func shuffleCard() {
            for index in deck.cards.indices {
                if index < 12 {
                    var cardTemp = deck.draw()!
                    cardTemp.isFaceUp = true
                    cards.append(cardTemp)
                }
                else {
                    cards.append(deck.draw()!)
                }
            }
        }
        shuffleCard()
    }
}
