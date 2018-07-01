//
//  ViewController.swift
//  Cards Memory
//
//  Created by Christopher De Jesus on 7/1/18.
//  Copyright © 2018 Christopher De Jesus. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var flipCount  = 0 {
        didSet {
            flipCountLabel.text  =  "Flips: \(flipCount)"
        }
    }
    
    var emojiChoices = ["🐊", "🐖", "🐖","🐊"]
    
    @IBOutlet weak var flipCountLabel: UILabel!
    
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = collectionOfCards.index(of: sender){
            flipCard(withEmoji: emojiChoices[cardNumber], on: sender)
        }

    }
    @IBOutlet var collectionOfCards: [UIButton]!
    
    
    func flipCard(withEmoji emoji: String, on button: UIButton ){
        if button.currentTitle == emoji{
            button.setTitle("", for: UIControlState.normal)
            button.backgroundColor = #colorLiteral(red: 1, green: 0.4218907992, blue: 0.06438108498, alpha: 1)
        }
        else {
        button.setTitle(emoji, for: UIControlState.normal)
            button.backgroundColor = #colorLiteral(red: 1, green: 0.15317265, blue: 0.5132747033, alpha: 1)
        }
    }
    
   
    

}

