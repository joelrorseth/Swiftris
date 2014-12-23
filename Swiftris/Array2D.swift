//
//  Array2D.swift
//  Swiftris
//
//  Created by Joel on 2014-10-26.
//  Copyright (c) 2014 Joel Rorseth. All rights reserved.
//

import Foundation

// Declare class for array type, make the parameter universal
class Array2D<T> {
    let columns: Int
    let rows: Int
    
    // Make an array of type 'Optional T'
    var array: Array<T?>
    
    init(columns: Int, rows: Int) {
        self.columns = columns
        self.rows = rows
        
        array = Array<T?>(count: rows * columns, repeatedValue: nil)
    }
    
    subscript(column: Int, row: Int) -> T? {
        get {
            return array[(row * columns) + column]
        }
        set(newValue) {
            array[(row * columns) + column] = newValue
        }
    }
}
