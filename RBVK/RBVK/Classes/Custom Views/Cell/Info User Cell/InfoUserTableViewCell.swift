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
    @IBOutlet private weak var emailTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!

    
    static var height: CGFloat {
        return 100
    }
    
    var photoViewClicked: VoidClosure? {
        didSet{
            photoView.clicked = photoViewClicked//тригер о нажатии передаеться в InfoUserTableViewCell
        }
    }
    
    var emailTextChanged: ItemClosure<String>?
    var passwordTextChanged: ItemClosure<String>?

    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        Decorator.decorate(self)
        addTargets()
        
    }
    
    private func addTargets(){
        emailTextField.addTarget(self, action: #selector(emailTextFieldChanged), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(passwordTextFieldChanged), for: .editingChanged)
    }
    @objc private func emailTextFieldChanged(sender: UITextField){
        emailTextChanged?(sender.text ?? "")
    }
    @objc private func passwordTextFieldChanged(sender: UITextField){
        passwordTextChanged?(sender.text ?? "")
    }
    
    func set(image: UIImage?){
        photoView.set(image: image)
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
