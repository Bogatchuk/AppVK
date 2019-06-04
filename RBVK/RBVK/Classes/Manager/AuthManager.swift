//
//  AuthManager.swift
//  RBVK
//
//  Created by Bogatchuk Roman on 6/3/19.
//  Copyright © 2019 Bogatchuk Roman. All rights reserved.
//

import Foundation
import FirebaseDatabase
import FirebaseStorage
import FirebaseAuth

class AuthManager {
    static let shared = AuthManager()
    
    private init(){}
    
    private var sourceRef: DatabaseReference {
        return Database.database().reference()
    }
    private let auth = Auth.auth()
    
    func register(with model: RegisterModel, completion: VoidClosure){
        guard model.isFilled else {
            return
        }
        guard let email = model.email, let password = model.password else {
            return
        }
        let usersRef = sourceRef.child("users")
        let id = UUID.init().uuidString
        auth.createUser(withEmail: email, password: password) { (result, error) in
            var dict = model.dict
            dict["id"] = id
           usersRef.child(id).setValue(dict)
            
        }
        
        
    }
    
    
}
