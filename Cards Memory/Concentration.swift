//
//  Concentration.swift
//  Cards Memory
//
//  Created by Christopher De Jesus on 7/1/18.
//  Copyright © 2018 Christopher De Jesus. All rights reserved.
//

import Foundation

class Concentration {
    
    var cards = [Card]()
    var IndexOfOnlyOneAndOnlyFaceUpCard: Int?
    
    
    func chooseCard(at index: Int){
        if !cards[index].isMatched {
            if let matchIndex = IndexOfOnlyOneAndOnlyFaceUpCard, matchIndex != index{
                //check if card match
                if cards[matchIndex].identifier == cards[index].identifier{
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceup = true
                IndexOfOnlyOneAndOnlyFaceUpCard = nil
                
                
            }
                else{
                    //either no card or 2 cards are face up
                for flipDownIndex in cards.indices{
                    cards[flipDownIndex].isFaceup = false
                }
                cards[index].isFaceup = true
                IndexOfOnlyOneAndOnlyFaceUpCard = index
            }
        }
    
        
}

    init(numberOfPairOfCards: Int) {
        for _ in 1...numberOfPairOfCards{
            let card = Card()
            cards += [card, card]
        }
        //TODO Shuffle the Cards
    }
}
