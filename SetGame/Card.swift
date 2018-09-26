//
//  Card.swift
//  SetGame
//
//  Created by Anti on 9/23/18.
//  Copyright © 2018 Anti. All rights reserved.
//

import Foundation
import UIKit

struct Card
{
    var number: Number
    var symbol: Symbol
    var shading: Shading
    var color: Color
    
    var isFaceUp = false
    var isSelected = false
    var isMatched = false
    
    // enums
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
        
        var match: Int {
            switch self {
            case .one: return 1
            case .two: return 2
            case .three: return 3
            }
        }
        
        static var all = [Symbol.one,.two,.three]
    }
    
    enum Shading {
        // filled in, hollow, striped
        case one
        case two
        case three
        
        var result: Int {
            switch self {
            case .one: return -1
            case .two: return 10
            case .three: return 15
            }
        }
        
        var match: Int {
            switch self {
            case .one: return 1
            case .two: return 2
            case .three: return 3
            }
        }
        
        static var all = [Shading.one,.two,.three]
    }
    
    enum Color {
        case one
        case two
        case three

        var result:  UIColor {
            switch self {
            case .one: return #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            case .two: return #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1)
            case .three: return #colorLiteral(red: 0.01680417731, green: 0.1983509958, blue: 1, alpha: 1)
            }
        }
        
        var match: Int {
            switch self {
            case .one: return 1
            case .two: return 2
            case .three: return 3
            }
        }
        
        static var all = [Color.one,.two,.three]
    }
    
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
