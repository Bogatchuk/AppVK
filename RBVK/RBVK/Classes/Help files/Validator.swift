 //
//  Validator.swift
//  RBVK
//
//  Created by Bogatchuk Roman on 6/4/19.
//  Copyright © 2019 Bogatchuk Roman. All rights reserved.
//

import Foundation

 enum Validator {
  static func isSimpleEmail(_ email: String) -> Bool {
    let emailRegEx = "^.+@.+\\..{2,}$"
    return check(text: email, regEx: emailRegEx)
  }
  
  private static func check(text: String, regEx: String) -> Bool {
    let predicate = NSPredicate(format: "SELF MATCHES %@", regEx)
    return predicate.evaluate(with: text)
  }
 }
