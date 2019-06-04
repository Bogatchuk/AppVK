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
  private var usersRef: DatabaseReference{
    return sourceRef.child("users")
  }
  
  func register(with model: RegisterModel, completion: @escaping ResultHandler<Void>){
    guard model.isFilled else {
      completion(.failure(CustomError.unknownError))
      return
    }
    guard let email = model.email, let password = model.password else {
      completion(.failure(CustomError.unknownError))
      return
    }
    
    guard Validator.isSimpleEmail(email) else {
      completion(.failure(CustomError.invalidEmail))
      return
      
    }
    
    
    let id = model.userId
    auth.createUser(withEmail: email, password: password) { (result, error) in
      if let error = error {
        completion(.failure(error))
      } else if let _ = result {
        var dict = model.dict
        dict["id"] = id
        self.usersRef.child(id).setValue(dict, withCompletionBlock: { (error, reference) in
          self.addAvatarUrlIfNeeded(for: model)
          completion(.success(()))
        })
      }else{
        completion(.failure(CustomError.unknownError))
      }
    }
  }
  func addAvatarUrlIfNeeded(for model: RegisterModel){
    StorageManager.shared.loadAvatarUrl(for: model) { (url) in
      guard let url = url else {return}
      self.usersRef.child(model.userId).child("avatarUrl").setValue(url.absoluteString)
    }
  }
}
