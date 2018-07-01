//
//  Card.swift
//  Cards Memory
//
//  Created by Christopher De Jesus on 7/1/18.
//  Copyright © 2018 Christopher De Jesus. All rights reserved.
//

import Foundation

struct Card {       //structs have no inheritance. Valued type.
    var isFaceup = false
    var isMatched = false
    var identifier: Int
    
    static var identifierFactory = 0
    
    static func getUniqueIdentifier() -> Int{
        identifierFactory += 1
        
        return identifierFactory
    }
    
    init(){
        self.identifier = Card.getUniqueIdentifier()
    }
}
