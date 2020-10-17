//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by 饶飞 on 2020/10/17.
//

import Foundation

struct EmojiMemoryGame {
    var model : MemoryGame<String>
    
    init() {
        model = MemoryGame<String>(numOfPairsOfCards: 2, cardContentFactory: EmojiMemoryGame.cardContentFactory)
    }
    
    static func cardContentFactory(index: Int) -> String{
        let data = ["🥶","🤡"]
        return data[index]
    }
    
    // Mark access to the model
    
    func getCards() -> Array<MemoryGame<String>.Card> {
        self.model.getCards()
    }
    
    func choose() {
//        model.choose()
    }
}
