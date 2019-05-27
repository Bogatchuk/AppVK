//
//  HeaderTitleView.swift
//  RBVK
//
//  Created by Bogatchuk Roman on 5/27/19.
//  Copyright © 2019 Bogatchuk Roman. All rights reserved.
//

import UIKit

class HeaderTitleView: UIView, NibLoadable {

    @IBOutlet private weak var label: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func set(title: String){
        label.text = title
    }
}
