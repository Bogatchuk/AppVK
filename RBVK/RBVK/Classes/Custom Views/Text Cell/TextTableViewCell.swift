//
//  TextTableViewCell.swift
//  RBVK
//
//  Created by Bogatchuk Roman on 5/30/19.
//  Copyright © 2019 Bogatchuk Roman. All rights reserved.
//

import UIKit

class TextTableViewCell: UITableViewCell, NibLoadable {
    @IBOutlet private weak var label: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }

    func set(text: String?){
        label.text = text
    }
 
}
