//
//  CellHeaderProtocol.swift
//  RBVK
//
//  Created by Bogatchuk Roman on 5/27/19.
//  Copyright © 2019 Bogatchuk Roman. All rights reserved.
//

import Foundation

protocol CellHeaderProtocol {
    associatedtype CellType
    var cellModels: [CellType]{get}
}
