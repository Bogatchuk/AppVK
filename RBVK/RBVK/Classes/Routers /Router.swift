//
//  Router.swift
//  RBVK
//
//  Created by Bogatchuk Roman on 5/26/19.
//  Copyright © 2019 Bogatchuk Roman. All rights reserved.
//

import Foundation
import UIKit
class Router {
    static let shared = Router()
    private init(){}
    
    private let rootViewController: UIViewController = ViewController()
    
    func root(_ window: inout UIWindow?){
        let frame = UIScreen.main.bounds
        
        window = UIWindow(frame: frame)
        window?.makeKeyAndVisible()
        window?.rootViewController = UINavigationController(rootViewController: rootViewController)
    }
}
