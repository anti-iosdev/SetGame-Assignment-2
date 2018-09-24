//
//  cardDeck.swift
//  SetGame
//
//  Created by Anti on 9/23/18.
//  Copyright © 2018 Anti. All rights reserved.
//

import Foundation

struct cardDeck
{
    var cards = [Card]()
    
    init() {
        for number in Card.Number.all {
            for symbol in Card.Symbol.all {
                for shading in Card.Triple.all {
                    for color in Card.Triple.all {
                        cards.append(Card(number: number, symbol: symbol, shading: shading, color: color))
                    }
                }
            }
        }
    }
    
    mutating func draw() -> Card? {
        if cards.count > 0 {
            return cards.remove(at: cards.count.arc4random)
        } else {
            return nil
        }
    }
}

extension Int {
    var arc4random: Int {
        if self > 0 {
            return Int(arc4random_uniform(UInt32(self)))
        } else if self < 0 {
            return -Int(arc4random_uniform(UInt32(abs(self))))
        } else {
            return 0
        }
    }
}
