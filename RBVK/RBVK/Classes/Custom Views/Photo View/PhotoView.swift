//
//  PhotoView.swift
//  RBVK
//
//  Created by Bogatchuk Roman on 5/27/19.
//  Copyright © 2019 Bogatchuk Roman. All rights reserved.
//

import UIKit

final class PhotoView: UIView {

  //  private let stackView = UIStackView()
    private let plusView = UIImageView()
    private let photoLabel = UILabel()
    var clicked: VoidClosure?
    override func didMoveToSuperview(){
        super.didMoveToSuperview()
        Decorator.decorate(self)
     //  addStackView()
        addPlusView()
        addPhotoLabel()
    }
    
    //нажатие на наш view  закончилось
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        clicked?()
    }
    private func addPhotoLabel(){
        photoLabel.text = "фото"
        photoLabel.translatesAutoresizingMaskIntoConstraints = false
        photoLabel.font = UIFont.systemFont(ofSize: 12)
        photoLabel.textAlignment = .center
        photoLabel.textColor = #colorLiteral(red: 0.2980392157, green: 0.4588235294, blue: 0.6392156863, alpha: 1)
        addSubview(photoLabel)
        
        let constraints = NSLayoutConstraint.constraints(withNewVisualFormat: "H:|[photoLabel]|,V:[photoLabel]-16-|", dict: ["photoLabel": photoLabel])
        addConstraints(constraints)
    }
    private func addPlusView(){
        plusView.translatesAutoresizingMaskIntoConstraints = false
        plusView.contentMode = .scaleAspectFit
        plusView.tintColor = #colorLiteral(red: 0.2980392157, green: 0.4588235294, blue: 0.6392156863, alpha: 1)
        plusView.image = #imageLiteral(resourceName: "add.png")
        addSubview(plusView)
        
        let constraints = NSLayoutConstraint.constraints(withNewVisualFormat: "H:|[plusView]|,V:|-(>=0)-[plusView(\(frame.height * 0.3))][photoLabel]", dict: ["photoLabel": photoLabel, "plusView": plusView])
        addConstraints(constraints)
      
    }
//    private func addStackView(){
//        stackView.translatesAutoresizingMaskIntoConstraints = false
//        stackView.distribution = .fillEqually
//        stackView.alignment = .center
//        stackView.axis = .vertical
//        addSubview(stackView)
//        let constraints = NSLayoutConstraint.constraints(withNewVisualFormat: "H:|[stackView]|,V:|[stackView]|", dict: ["stackView" : stackView])
//        addConstraints(constraints)
//    }
    
    
    override func layoutSubviews(){
        super.layoutSubviews()
        Decorator.layoutSubviews(self)
    }

}

extension PhotoView {
    final fileprivate class Decorator {
        static func decorate(_ view: PhotoView){
            view.layer.borderColor = #colorLiteral(red: 0.6941176471, green: 0.6941176471, blue: 0.6941176471, alpha: 1)
            view.layer.borderWidth = 1
        }
        static func layoutSubviews(_ view: PhotoView){
            view.round()
        }
    }
}
