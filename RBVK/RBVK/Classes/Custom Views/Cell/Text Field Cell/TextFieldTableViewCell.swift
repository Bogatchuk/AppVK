//
//  TextFieldTableViewCell.swift
//  RBVK
//
//  Created by Bogatchuk Roman on 5/30/19.
//  Copyright © 2019 Bogatchuk Roman. All rights reserved.
//

import UIKit

class TextFieldTableViewCell: UITableViewCell, NibLoadable {
    @IBOutlet weak var textField: UITextField!
    
    var textChanged: ItemClosure<String>?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        addTargets()
    }

    private func addTargets(){
        textField.addTarget(self, action: #selector(textFieldChanged), for: .editingChanged)
    }
    @objc private func textFieldChanged(sender: UITextField){
        textChanged?(sender.text ?? "")
    }
}
