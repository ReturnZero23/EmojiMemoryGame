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
        Grid(viewModel.getCards()) { card in
            CardView(card: card).onTapGesture(){
                self.viewModel.choose(card: card)
            }
            .padding(5)
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
    
    @ViewBuilder
    private func body(size: CGSize) -> some View {
        if card.isFaceUp || !card.isMatched {
            ZStack{
                Pie(startAngle: Angle.degrees(0-90), endAngle: Angle.degrees(110-90))
                    .padding()
                    .opacity(0.5)
                Text(self.card.content)
                    .font(Font.system(size: self.fontSize(size: size)))
                    .rotationEffect(Angle.degrees(card.isMatched ? 360 : 0 ))
                    .animation(card.isMatched ? Animation.linear(duration: 1).repeatForever(autoreverses: false) : .default)
            }
            .cardify(isFaceUp: card.isFaceUp)
        }
    }
    
    func fontSize(size: CGSize) -> CGFloat {
        min(size.width, size.height) * fontScaleFactor
    }
    
    private let fontScaleFactor: CGFloat = 0.75
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        game.choose(card: game.getCards()[0])
        return Group {
            ContentView(viewModel: game)
                .preferredColorScheme(.dark)
            ContentView(viewModel: game)
                .preferredColorScheme(.dark)
        }
    }
}
