//
//  StartRouter.swift
//  RBVK
//
//  Created by Bogatchuk Roman on 5/27/19.
//  Copyright © 2019 Bogatchuk Roman. All rights reserved.
//

import Foundation
import UIKit

final class StartRouter{
    static let shared = StartRouter()
    private init(){}
    func goToRegisterScreen(from source: UIViewController){
        let vc = RegisterViewController()
        source.navigationController?.pushViewController(vc, animated: true)
    }
}
