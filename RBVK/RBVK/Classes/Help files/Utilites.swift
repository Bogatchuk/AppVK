//
//  Utilites.swift
//  RBVK
//
//  Created by Bogatchuk Roman on 6/4/19.
//  Copyright © 2019 Bogatchuk Roman. All rights reserved.
//

import Foundation
func ID() -> String {
    let str = "gdsnknlgjksfdfgjs5293453223460"
    let arr = Array(str)
    func random() -> String {
    return String(describing: (Int.random(in: arr.indices)))
    }
    var result = ""
    let countOfCharacter = 12
    for _ in 0..<countOfCharacter{
        result += random()
    }
    return result
}
