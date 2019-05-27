//
//  ViewController.swift
//  RBVK
//
//  Created by Bogatchuk Roman on 5/26/19.
//  Copyright © 2019 Bogatchuk Roman. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var logoView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Decorator.decorete(self)
        addTargets()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }

    private func addTargets(){
        signInButton.addTarget(self,action: #selector(signInButtonClicked), for: .touchUpInside)
        signUpButton.addTarget(self, action: #selector(signUpButtonClicked), for: .touchUpInside)
    }
    @objc func signInButtonClicked(){
    
    }

    @objc func signUpButtonClicked(){
    StartRouter.shared.goToRegisterScreen(from: self)
    }
}

extension ViewController {
    fileprivate class Decorator {
        static let buttonCornerRadius: CGFloat = 8
        private init(){}
        
        static func decorete(_ vc: ViewController){
           vc.signUpButton.layer.cornerRadius = buttonCornerRadius
           vc.signUpButton.layer.borderColor = #colorLiteral(red: 0.6941176471, green: 0.6941176471, blue: 0.6941176471, alpha: 1)
        }
    }
}
