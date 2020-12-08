//
//  ContentView.swift
//  Memorize
//
//  Created by 饶飞 on 2020/10/17.
//

import SwiftUI


struct ContentView: View {
    var viewModel : EmojiMemoryGame
    
    var body: some View {
        HStack{
            ForEach(viewModel.getCards()) { card in
                CardView(card: card)
                    .onTapGesture(){
                        self.viewModel.choose(card: card)
                }
            }
        }
            .padding()
            .foregroundColor(Color.orange)
            .font(Font.largeTitle)
        
    }
}

struct CardView: View {
    
    var card: MemoryGame<String>.Card
    
    var body : some View {
        ZStack{
            if(card.isFaceUp){
                RoundedRectangle(cornerRadius: 10).fill(Color.white)
                RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 3)
                Text(card.content)
                    .font(Font.largeTitle)
                    .padding()
            } else {
                RoundedRectangle(cornerRadius: 10).fill(Color.yellow)
            }
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: EmojiMemoryGame())
            .preferredColorScheme(.dark)
    }
}
