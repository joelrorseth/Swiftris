//
//  Block.swift
//  Swiftris
//
//  Created by Joel on 2014-10-26.
//  Copyright (c) 2014 Joel Rorseth. All rights reserved.
//

import SpriteKit

let NumberOfColors: UInt32 = 6

enum BlockColor: Int, Printable {
    
    
    case Blue = 0, Orange, Purple, Red, Teal, Yellow
    
    // Make a computed property
    var spriteName: String {
        switch self {
        case .Blue:
            return "blue"
        case .Orange:
            return "orange"
        case .Purple:
            return "purple"
        case .Red:
            return "red"
        case .Teal:
            return "teal"
        case .Yellow:
            return "yellow"
        }
    }
    
    // required for Printable protocol
    var description: String {
        return self.spriteName
    }
    
    // Randomly choose a color
    static func random() -> BlockColor {
        //return BlockColor.fromRaw(Int(arc4random_uniform(NumberOfColors)))!
        return BlockColor(rawValue: Int(arc4random_uniform(NumberOfColors)))!
    }
}

// Hashable protocol will allow 'Block' to be stored in Array2D
class Block: Hashable, Printable {
    
    let color: BlockColor
    
    var column: Int
    var row: Int
    var sprite: SKSpriteNode? // this is the sprite of the block
    
    // Another computed property, spriteName
    var spriteName: String {
        return color.description
    }
    
    var hashValue: Int {
        return self.column ^ self.row
    }
    
    var description: String {
        return "\(color): [\(column), \(row)"
    }
    
    init(column:Int, row:Int, color:BlockColor) {
        self.column = column
        self.row = row
        self.color = color
    }
}

// Create a custom operator == to compare blocks to eachother, required by 'Hashable'
// returns true if and only if both Blocks are in the same location and of the same color
func ==(lhs: Block, rhs: Block) -> Bool {
    return lhs.column == rhs.column && lhs.row == rhs.row && lhs.color.rawValue == rhs.color.rawValue
}

