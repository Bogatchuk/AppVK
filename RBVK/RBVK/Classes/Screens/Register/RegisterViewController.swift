//
//  RegisterViewController.swift
//  RBVK
//
//  Created by Bogatchuk Roman on 5/27/19.
//  Copyright © 2019 Bogatchuk Roman. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    private var models: [CellModel] = [.userInfo, .sex, .birthday]
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Регистрация"
        registerCells()
        delegating()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    private func delegating(){
        tableView.dataSource = self
        tableView.delegate = self
    }

    private func registerCells(){
        tableView.register(InfoUserTableViewCell.nib, forCellReuseIdentifier: InfoUserTableViewCell.name)
    }
}
extension RegisterViewController{
    enum CellModel{
        case userInfo
        case sex
        case birthday
    }
}

extension RegisterViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let model = models[indexPath.row]
        switch model {
        case .userInfo:
            return 100
        default:
            return 0
        }
    }
}
extension RegisterViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = models[indexPath.row]
        switch model {
        case .userInfo:
            if let cell = tableView.dequeueReusableCell(withIdentifier: InfoUserTableViewCell.name, for: indexPath) as? InfoUserTableViewCell{
                return cell
            }
        default:
            break
        }
        return UITableViewCell()
    }

}
