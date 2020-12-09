//
//  Grid.swift
//  Memorize
//
//  Created by 饶飞 on 2020/12/9.
//

import SwiftUI

struct Grid<Item, ItemView>: View where Item: Identifiable, ItemView: View{
    var items: [Item]
    var viewForItem: (Item) -> ItemView
    
    init(_ items: [Item],  viewForItem: @escaping (Item) -> ItemView) {
        self.items = items
        self.viewForItem = viewForItem
    }
    
    var body: some View {
        ForEach(items) { item in
            self.viewForItem(item)
        }
    }
    
    func body(for layout: GridLayout) -> some View {
        ForEach(items) { item in
            self.body(for: item, in: layout)
        }
    }
    
    func body(for item: Item, in layout: GridLayout) -> some View {
        let index = self.index(of: item)
        return viewForItem(item)
            .frame(width: layout.itemSize.width, height: layout.itemSize.height)
            .position(layout.location(ofItemAt: index))
        
    }
    
    func index(of item : Item) -> Int {
        for index in 0..<items.count {
            if self.items[index].id == item.id {
                return index
            }
        }
        return 0 // bogus
    }
}
