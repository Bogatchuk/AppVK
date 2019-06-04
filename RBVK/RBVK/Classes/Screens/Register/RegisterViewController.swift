//
//  RegisterViewController.swift
//  RBVK
//
//  Created by Bogatchuk Roman on 5/27/19.
//  Copyright © 2019 Bogatchuk Roman. All rights reserved.
//

import UIKit
import ARSLineProgress // индикатор загрузки / заглушка

class RegisterViewController: UIViewController {
  
  @IBOutlet weak var tableView: UITableView!
  private let models:[HeaderModel] = [.info, .sex, .birthday]
  private let sexModels:[Sex] = [.male,.female]
  private var registerModel = RegisterModel()
  
  private let datePickerView: UIDatePicker = {
    let picker = UIDatePicker()
    picker.maximumDate = Date()// максимальная дата сегодня
    return picker
  }()
  override func viewDidLoad() {
    super.viewDidLoad()
    title = "Регистрация"
    Decorator.decorate(self)
    registerCells()
    delegating()
    configureDatePickerView()
    addRightBarButton()
    updateDoneButtonStatus()//что бы изначально ее заблокировать
  }
  
  private func addRightBarButton(){
    let barButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(rightBarButtonClicked))
    navigationItem.rightBarButtonItem = barButton
  }
  
  //вызываеться везде где происходят изменения
  private func updateDoneButtonStatus(){
    navigationItem.rightBarButtonItem?.isEnabled = registerModel.isFilled
  }
  @objc private func rightBarButtonClicked(sender: UIBarButtonItem){
    ARSLineProgress.show()
    AuthManager.shared.register(with: registerModel) {result in
      ARSLineProgress.hide()
      switch result {
      case .success(_):  self.showAlert(with: "Успешно", and: "Вы зарегистрированы.")
      case .failure(let error):  self.showAlert(with: "Ошибка", and: error.localizedDescription)
      }
      
    }
    
  }
  
  private func configureDatePickerView(){
    datePickerView.addTarget(self, action: #selector(datePickerChanged), for: .valueChanged)
  }
  
  @objc private func datePickerChanged(sender: UIDatePicker){
    let date = sender.date
    registerModel.birthday = date
    updateDoneButtonStatus()
  }
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    navigationController?.setNavigationBarHidden(false, animated: true)
  }
  private func delegating(){
    tableView.dataSource = self
    tableView.delegate = self
  }
  
  private func photoViewClicked(){
    let imagePickerController = UIImagePickerController()
    imagePickerController.delegate = self
    imagePickerController.sourceType = .photoLibrary
    present(imagePickerController, animated: true)
    
  }
  
  private func registerCells(){
    tableView.register(InfoUserTableViewCell.nib, forCellReuseIdentifier: InfoUserTableViewCell.name)
    tableView.register(SegmenterTableViewCell.nib, forCellReuseIdentifier: SegmenterTableViewCell.name)
    //tableView.register(TextTableViewCell.nib, forCellReuseIdentifier: TextTableViewCell.name)
    tableView.register(TextFieldTableViewCell.nib, forCellReuseIdentifier: TextFieldTableViewCell.name)
  }
}

extension RegisterViewController:UINavigationControllerDelegate, UIImagePickerControllerDelegate {
  //достаем выбранное изображение
  func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
    picker.dismiss(animated: true, completion: nil) // после выбора фото picker закрываеться
    guard let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else {
      return
    }
    registerModel.photo = image
    updateDoneButtonStatus()
    
    ARSLineProgress.show()
    StorageManager.shared.upload(photo: image, by: registerModel){
      ARSLineProgress.hide()
    }
    tableView.reloadData()
    
  }
}

extension RegisterViewController{
  fileprivate enum CellModel{
    case userInfo
    case sex
    case birthday
  }
  
  fileprivate enum HeaderModel: CellHeaderProtocol {
    typealias CellType = CellModel
    case sex
    case info
    case birthday
    
    var cellModels: [RegisterViewController.CellModel] {
      switch self {
      case .sex: return [.sex]
      case .info: return [.userInfo]
      case .birthday: return [.birthday]
      }
    }
  }
}
extension RegisterViewController {
  private static let tabelViewTopInset: CGFloat = 32
  fileprivate class Decorator{
    
    static func decorate(_ vc: RegisterViewController){
      vc.tableView.backgroundColor = #colorLiteral(red: 0.9450980392, green: 0.9450980392, blue: 0.9450980392, alpha: 1)
      vc.tableView.separatorColor = .clear
      vc.tableView.keyboardDismissMode = .onDrag // когда свайпаем по таблице , клавиатура скрываеться
      vc.navigationController?.navigationBar.prefersLargeTitles = true
      vc.tableView.contentInset = UIEdgeInsets(top: tabelViewTopInset, left: 0, bottom: 0, right: 0)
    }
  }
}
extension RegisterViewController: UITableViewDelegate{
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    let model = models[indexPath.section].cellModels[indexPath.row]
    switch model {
    case .userInfo:
      return 100
    case .sex, .birthday:
      return 44
    }
  }
}
extension RegisterViewController: UITableViewDataSource{
  
  func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    let heareModel = models[section]
    switch heareModel {
    case .sex:
      let view = HeaderTitleView.loadFromNib()
      view.set(title: "Ваш пол:")
      return view
    default:
      return nil
    }
    
  }
  
  func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    let heareModel = models[section]
    switch heareModel {
    case .sex, .birthday:
      return 44
      
    default:
      return 0
    }
    
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return models[section].cellModels.count
  }
  
  
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let model = models[indexPath.section].cellModels[indexPath.row]
    switch model {
    case .userInfo:
      if let cell = tableView.dequeueReusableCell(withIdentifier: InfoUserTableViewCell.name, for: indexPath) as? InfoUserTableViewCell{
        cell.photoViewClicked = self.photoViewClicked
        cell.set(image: registerModel.photo)
        cell.emailTextChanged = {
          text in
          self.registerModel.email = text
          self.updateDoneButtonStatus()
        }
        cell.passwordTextChanged = {
          text in
          self.registerModel.password = text
          self.updateDoneButtonStatus()
        }
        return cell
      }
    case .sex:
      if let cell = tableView.dequeueReusableCell(withIdentifier: SegmenterTableViewCell.name, for: indexPath) as? SegmenterTableViewCell{
        //ставим название к нашему сегменту, взяли rawValue и превратили его в String с большой буквы
        cell.set(titles: sexModels.map{$0.rawValue.capitalized})
        cell.indexChanged = { index in
          let sex = self.sexModels[index]
          self.registerModel.sex = sex
          self.updateDoneButtonStatus()
        }
        return cell
      }
    case .birthday:
      if let cell = tableView.dequeueReusableCell(withIdentifier: TextFieldTableViewCell.name, for: indexPath) as? TextFieldTableViewCell{
        //  cell.set(text: "Дата рождения")
        cell.textField.inputView = datePickerView
        return cell
      }
    }
    return UITableViewCell()
  }
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return 3
  }
}
