//
//  Typealias.swift
//  RBVK
//
//  Created by Bogatchuk Roman on 5/27/19.
//  Copyright © 2019 Bogatchuk Roman. All rights reserved.
//

import Foundation
typealias StaticCellProtocol = NibLoadable & HeightContainable
typealias ItemClosure<T> = ((T) -> Void)
typealias OptionalItemClosure<T> = ((T?) -> Void)
typealias VoidClosure = (() -> Void)
typealias ResultHandler<Value> = (Result<Value>) -> Void
