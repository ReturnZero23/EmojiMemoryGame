//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by 饶飞 on 2020/10/17.
//

import Foundation

class EmojiMemoryGame: ObservableObject {
    @Published private var model : MemoryGame<String>
    
    init() {
        model = MemoryGame<String>(numOfPairsOfCards: 6, cardContentFactory: EmojiMemoryGame.cardContentFactory)
    }
    
    static func cardContentFactory(index: Int) -> String{
        let data = ["🥶","🤡", "👻", "🎃", "☠️", "🤪"]
        return data[index]
    }
    
    // Mark access to the model
    
    func getCards() -> Array<MemoryGame<String>.Card> {
        self.model.cards
    }
    
    func choose(card: MemoryGame<String>.Card) {
        model.choose(card: card)
    }
    
    func resetGame() {
        model = MemoryGame<String>(numOfPairsOfCards: 6, cardContentFactory: EmojiMemoryGame.cardContentFactory)
    }
}
