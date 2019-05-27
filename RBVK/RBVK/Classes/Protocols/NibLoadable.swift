//
//  NibLoadable.swift
//  RBVK
//
//  Created by Bogatchuk Roman on 5/27/19.
//  Copyright © 2019 Bogatchuk Roman. All rights reserved.
//

import UIKit
//Протокол позволяет получить доступ к Nib напрямую
protocol NibLoadable: class {
    static var nib: UINib { get }
}

extension NibLoadable {
    static var nib: UINib {
        return UINib(nibName: name, bundle: Bundle.init(for: self))
    }
    //получаем имя нашего класса
    static var name: String {
        return String(describing: self)
    }
}

extension NibLoadable where Self: UIView {
    //Возвращает View  этого класса  если названия класса совпадает с названием xib
    static func loadFromNib() -> Self {
        guard let view = nib.instantiate(withOwner: nil, options: nil).first as? Self else {
            fatalError()
        }
        return view
    }
}
