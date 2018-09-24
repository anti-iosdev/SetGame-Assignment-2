//
//  Card.swift
//  SetGame
//
//  Created by Anti on 9/23/18.
//  Copyright © 2018 Anti. All rights reserved.
//

import Foundation

struct Card
{
    var number: Number
    var symbol: Symbol
    var shading: Triple
    var color: Triple
    
//    var suit: Suit
//    enum Suit {
//        case spades
//        case hearts
//        case clubs
//        case diamonds
//
//        static var all = [Suit.spades,.hearts,.diamonds,.clubs]
//    }
    
    enum Number {
        case one
        case two
        case three
        
        var result: Int {
            switch self {
            case .one: return 1
            case .two: return 2
            case .three: return 3
            }
        }
        
        static var all = [Number.one,.two,.three]

    }
    
    enum Symbol {
        case one
        case two
        case three
        
        var result: String {
            switch self {
            case .one: return "▲"
            case .two: return "●"
            case .three: return "■"
            }
        }
        
        static var all = [Symbol.one,.two,.three]
    }
    
    enum Shading {
        case one
        case two
        case three
    }
    
//    enum Color {
//        case one
//        case two
//        case three
//
//        var result:  {
//            switch self {
//            case .one: return #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
//            case .two: return #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
//            case .three: return #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
//            }
//        }
//    }
    
    enum Triple {
        //case symbol
        case one
        case two
        case three
        
        var result: Int {
            switch self {
            case .one: return 1
            case .two: return 2
            case .three: return 3
            }
        }
        
        static var all = [Triple.one, Triple.two, Triple.three]
    }
    
//    enum Symbol {
//        case one
//        case two
//        case three
//
//        var result: Int {
//            switch self {
//            case .one: return 1
//            case .two: return 2
//            case .three: return 3
//            }
//        }
//    }
    
//    enum Number: Int {
//        case one = 1
//        case two = 2
//        case three = 3
//    }
//
//    enum Symbol {
//        case symbol_1
//        case symbol_2
//        case symbol_3
//    }
//
//    enum Shading {
//        case shading_1
//        case shading_2
//        case shading_3
//    }
//
//    enum Color {
//        case color_1
//        case color_2
//        case color_3
//    }
}
