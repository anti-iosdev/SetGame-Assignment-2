//
//  ViewController.swift
//  SetGame
//
//  Created by Anti on 9/23/18.
//  Copyright © 2018 Anti. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var deck = cardDeck()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for _ in 1...10 {
            if let card = deck.draw() {
                // print("\(card)")
                
                var testValue = 0
                // let myEnum = card.number
                switch card.number {
                case .one: print("one")
                    testValue += 1
                print("testValue: \(testValue)")
                case .two: print("two")
                    testValue += 2
                    print("testValue: \(testValue)")
                case .three: print("three")
                    testValue += 3
                    print("testValue: \(testValue)")
                }
            }
        }
        

        // var cardTest = Card(number: two)
        
    }


}

