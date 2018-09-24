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
    var deck = cardDeck() {
        didSet {
            updateViewFromModel()
        }
    }
    
    // Button Code
    @IBOutlet var cardButtons: [UIButton]!
    
    @IBAction func touchCard(_ sender: UIButton) {
        // updateViewFromModel()
    }
    
    // string for card back
    func cardTitle(for card: Card) -> NSAttributedString {
        
        let color = #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
        let strokeWidth = 5.0
        
        let attributes: [NSAttributedString.Key:Any] = [
            .strokeWidth : strokeWidth,
            .strokeColor : color
        ]
        let attributedString = NSAttributedString(string: "hello world", attributes: attributes)
        
//        let attribute2: [NSAttributedString.Key:Any] = [
//            .strokeColor : #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
//        ]
        
        // attributes[NSAttributedString.Key.strokeColor = #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)]
        
        
        
        return attributedString
    }
    
    // UpdateView
    func updateViewFromModel() {
        for index in cardButtons.indices {
            let button = cardButtons[index]
            
            // debugging
            let color = #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
            let strokeWidth = 5.0
            
            let attributes: [NSAttributedString.Key:Any] = [
                .strokeWidth : strokeWidth,
                .strokeColor : color
            ]
            let attributedString = NSAttributedString(string: "hello world", attributes: attributes)
            
            button.setAttributedTitle(attributedString, for: UIControl.State.normal)
            
            //button.setTitle("testing", for: UIControl.State.normal)
            
            // rounded corners
            button.layer.cornerRadius = 8.0
            
            // fix later
            // let card = deck.cards[index]
        }
    }
    // debugging
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for _ in 1...10 {
            if let card = deck.draw() {
                 print("\(card)")
                print("Symbol: \(card.symbol) = \(card.symbol.result)")

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

