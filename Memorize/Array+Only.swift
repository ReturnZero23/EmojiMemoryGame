//
//  Array+Only.swift
//  Memorize
//
//  Created by 饶飞 on 2020/12/12.
//

import Foundation

extension Array {
    var only: Element? {
        count == 1 ? first : nil
    }
}
