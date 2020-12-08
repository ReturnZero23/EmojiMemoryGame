//
//  ContentView.swift
//  Memorize
//
//  Created by 饶飞 on 2020/10/17.
//

import SwiftUI


struct ContentView: View {
    @ObservedObject var viewModel : EmojiMemoryGame
    
    var body: some View {
        HStack{
            ForEach(viewModel.getCards()) { card in
                CardView(card: card).onTapGesture(){
                    viewModel.choose(card: card)
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
        GeometryReader(content: { geometry in
            ZStack{
                if(self.card.isFaceUp){
                    RoundedRectangle(cornerRadius: 10).fill(Color.white)
                    RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 3)
                    Text(self.card.content)
                        
                } else {
                    RoundedRectangle(cornerRadius: 10).fill(Color.yellow)
                }
            }
            .font(Font.system(size: min(geometry.size.width, geometry.size.height) * 0.75))
        })
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: EmojiMemoryGame())
            .preferredColorScheme(.dark)
    }
}
