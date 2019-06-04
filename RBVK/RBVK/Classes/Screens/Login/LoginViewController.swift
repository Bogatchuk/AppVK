//
//  LoginViewController.swift
//  RBVK
//
//  Created by Bogatchuk Roman on 6/4/19.
//  Copyright © 2019 Bogatchuk Roman. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
  @IBOutlet weak var emailTextField: TextField!
  @IBOutlet weak var passwordTextField: TextField!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    title = "Вход"
    addRightButton()
  }
  private func addRightButton(){
    let button = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneButtonClicked))
    navigationItem.rightBarButtonItem = button
  }
  @objc private func doneButtonClicked(){
    let email = emailTextField.text ?? ""
    let password = passwordTextField.text ?? ""
    
    guard !email.isEmpty && !password.isEmpty else {
      showAlert(with: "Ошибка", and: "Заполните все поля!")
      return
    }
    
    AuthManager.shared.signIn(with: email, and: password) { (result) in
      switch result {
      case .success:
        self.showAlert(with: "Успех", and: "Вы авторизованы!")
      case .error(let error):
        self.showAlert(with: "Ошибка", and: error.localizedCapitalized)
      }
    }
  }
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    navigationController?.navigationBar.prefersLargeTitles = true
    navigationController?.setNavigationBarHidden(false, animated: true)
  }
  
   
}
