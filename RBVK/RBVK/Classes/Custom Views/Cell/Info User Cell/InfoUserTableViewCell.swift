//
//  InfoUserTableViewCell.swift
//  RBVK
//
//  Created by Bogatchuk Roman on 5/27/19.
//  Copyright © 2019 Bogatchuk Roman. All rights reserved.
//

import UIKit

class InfoUserTableViewCell: UITableViewCell, StaticCellProtocol {
    
    @IBOutlet private weak var backgroundFieldsView: UIView!
    @IBOutlet private weak var photoView: PhotoView!
    
    static var height: CGFloat {
        return 100
    }
    
    var photoViewClicked: VoidClosure?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        Decorator.decorate(self)
        
        photoViewClicked = photoView.clicked//тригер о нажатии передаеться в InfoUserTableViewCell
        
    }
    
}

extension InfoUserTableViewCell{
    fileprivate class Decorator{
        static func decorate(_ cell: InfoUserTableViewCell){
            cell.selectionStyle = .none // что бы ячейка не выделялась
            cell.backgroundColor = #colorLiteral(red: 0.9450980392, green: 0.9450980392, blue: 0.9450980392, alpha: 1)
            cell.backgroundFieldsView.layer.borderColor = #colorLiteral(red: 0.6941176471, green: 0.6941176471, blue: 0.6941176471, alpha: 1)
            cell.backgroundFieldsView.layer.borderWidth = 0.5
        }
    }
}
