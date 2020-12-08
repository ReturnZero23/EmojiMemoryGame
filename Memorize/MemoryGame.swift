//
//  MemoryGame.swift
//  Memorize
//
//  Created by 饶飞 on 2020/10/17.
//

import Foundation

struct MemoryGame<CardContent>{
    private var cards: Array<Card>
    
    struct Card : Identifiable {
        var id: Int
        var isFaceUp : Bool = false
        var isMatch: Bool = false
        var content : CardContent
    }
    
    init(numOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = Array<Card>()
        for pairIndex in 0..<numOfPairsOfCards {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(id:pairIndex * 2,isFaceUp: true,content: content))
            cards.append(Card(id:pairIndex * 2 + 1,isFaceUp: false,content: content))
        }
    }
    
    // get
    
    public func getCards() -> Array<Card> {
        cards
    }
    
    // set
    func index(of: Card) -> Int {
        for index in 0..<self.cards.count {
            if self.cards[index].id == of.id {
                return index
            }
        }
        return 0 // bogus
    }
    
    public mutating func choose(card: Card) {
        print(card)
        let choseIndex = index(of: card)
        self.cards[choseIndex].isFaceUp = !self.cards[choseIndex].isFaceUp
    }
    
}
