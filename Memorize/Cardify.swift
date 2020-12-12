//
//  Cardify.swift
//  Memorize
//
//  Created by 饶飞 on 2020/12/12.
//

import SwiftUI

struct Cardify : ViewModifier {
    var isFaceUp : Bool = false
    
    func body(content: Content) -> some View {
        ZStack{
            if(self.isFaceUp){
                RoundedRectangle(cornerRadius: cornerRadius).fill(Color.white)
                RoundedRectangle(cornerRadius: cornerRadius).stroke(lineWidth: edgeLineWidth)
                content
            } else {
                RoundedRectangle(cornerRadius: cornerRadius).fill(Color.yellow)
            }
        }
    }
    
    private let cornerRadius: CGFloat = 10.0
    private let edgeLineWidth: CGFloat = 3
}

extension View {
    func cardify(isFaceUp: Bool) -> some View {
        self.modifier(Cardify(isFaceUp: isFaceUp))
    }
}


