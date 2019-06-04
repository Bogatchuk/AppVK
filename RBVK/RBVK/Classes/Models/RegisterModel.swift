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
    var userId: String
    
    init(){
        self.userId = UUID.init().uuidString
    }
    
    var isFilled: Bool {
        guard !(email ?? "").isEmpty, !(password ?? "").isEmpty, birthday != nil else {
            return false
        }
        return true
    }
    
    //словарь для отправки в firebase
    var dict: [String: Any] {
        return [
            "email": email ?? "",
            "password": password ?? "",
            "sex": sex.hashValue,
            "birthday": (birthday ?? Date()).timeIntervalSince1970//timeIntervalSince1970 формат времени который отсчитывает секунды с 1 января 1970 года - формат UNIX , формат для хранения времени на серверах (1010214356)
        ]
    }
}
