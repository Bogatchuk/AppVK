//
//  RegisterModel.swift
//  RBVK
//
//  Created by Bogatchuk Roman on 5/31/19.
//  Copyright © 2019 Bogatchuk Roman. All rights reserved.
//

import UIKit

class RegisterModel{
    var photo: UIImage?
    var email: String?
    var password: String?
    var sex: Sex = .male
    var birthday: Date?
    
    var isFilled: Bool {
        guard !(email ?? "").isEmpty, !(password ?? "").isEmpty, birthday != nil else {
            return false
        }
        return true
    }
}
