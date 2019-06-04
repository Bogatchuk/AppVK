//
//  CustomError.swift
//  RBVK
//
//  Created by Bogatchuk Roman on 6/4/19.
//  Copyright © 2019 Bogatchuk Roman. All rights reserved.
//

import Foundation

enum Result<Value> {
    case success(Value)
    case failure(Error)
}

enum CustomError {
    case invalidEmail
    case unknownError
    case serverError
}

extension CustomError: LocalizedError {
    
    var errorDescription: String? {
        switch self {
        case .invalidEmail:
            return NSLocalizedString("email_is_not_valid", comment: "")
        case .serverError, .unknownError:
            return NSLocalizedString("server_error", comment: "")
        }
    }
}
