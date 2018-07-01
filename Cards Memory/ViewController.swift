//
//  ViewController.swift
//  Cards Memory
//
//  Created by Christopher De Jesus on 7/1/18.
//  Copyright © 2018 Christopher De Jesus. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var game = Concentration(numberOfPairOfCards: ( collectionOfCards.count + 1) / 2)
    
    var flipCount  = 0 {
        didSet {            //property observer
            flipCountLabel.text  =  "Flips: \(flipCount)"
        }
    }
    
    
    @IBOutlet weak var flipCountLabel: UILabel!
    
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = collectionOfCards.index(of: sender){
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
            
            }
    }
    
    func updateViewFromModel(){
        for index in collectionOfCards.indices{
            let button = collectionOfCards[index]
            let card = game.cards[index]
            if card.isFaceup {
                button.setTitle(emoji (for: card), for: UIControlState.normal)
                button.backgroundColor = #colorLiteral(red: 1, green: 0.4218907992, blue: 0.06438108498, alpha: 1)
            }else{
                button.setTitle("", for: UIControlState.normal)
                button.backgroundColor = card.isMatched ?  #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0): #colorLiteral(red: 1, green: 0.15317265, blue: 0.5132747033, alpha: 1)
            }
            
        }
    }
    
    var emojiChoices = ["🐊", "🦈", "🐖","🐉", "🐋", "🦐"]
    var emoji = Dictionary<Int, String>()
    
    func emoji(for card: Card) -> String {
        if emoji[card.identifier] == nil{
            if emojiChoices.count > 0 {
            let randomIndex = Int(arc4random_uniform( UInt32(emojiChoices.count) ) )
            emoji[card.identifier] = emojiChoices.remove(at: randomIndex)
            }
        }
        
        if emoji[card.identifier] != nil{
            return emoji[card.identifier]!
        }else{
        return "?"
        }
    }
    
    @IBOutlet var collectionOfCards: [UIButton]!
    //testing github source control
    
    
   
    

}

