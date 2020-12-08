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
            self.body(size: geometry.size)
        })
    }
    
    func body(size: CGSize) -> some View {
        ZStack{
            if(self.card.isFaceUp){
                RoundedRectangle(cornerRadius: cornerRadius).fill(Color.white)
                RoundedRectangle(cornerRadius: cornerRadius).stroke(lineWidth: edgeLineWidth)
                Text(self.card.content)
                    
            } else {
                RoundedRectangle(cornerRadius: cornerRadius).fill(Color.yellow)
            }
        }
        .font(Font.system(size: self.fontSize(size: size)))
    }
    
    func fontSize(size: CGSize) -> CGFloat {
        min(size.width, size.height) * fontScaleFactor
    }
    
    let cornerRadius: CGFloat = 10.0
    let edgeLineWidth: CGFloat = 3
    let fontScaleFactor: CGFloat = 0.75
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: EmojiMemoryGame())
            .preferredColorScheme(.dark)
    }
}
