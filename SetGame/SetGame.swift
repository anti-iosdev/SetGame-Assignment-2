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
