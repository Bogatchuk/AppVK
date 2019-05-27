//
//  PhotoView.swift
//  RBVK
//
//  Created by Bogatchuk Roman on 5/27/19.
//  Copyright © 2019 Bogatchuk Roman. All rights reserved.
//

import UIKit

final class PhotoView: UIView {

    private let stackView = UIStackView()
    private let plusView = UIImageView()
    private let photoLabel = UILabel()
    
    override func didMoveToSuperview(){
        super.didMoveToSuperview()
        addStackView()
        addPlusView()
        addPhotoLabel()
    }
    private func addPhotoLabel(){
        photoLabel.text = "фото"
        photoLabel.font = UIFont.systemFont(ofSize: 9)
        photoLabel.textColor = #colorLiteral(red: 0.2980392157, green: 0.4588235294, blue: 0.6392156863, alpha: 1)
        stackView.addArrangedSubview(photoLabel)
    }
    private func addPlusView(){
       // plusView.translatesAutoresizingMaskIntoConstraints = false
        plusView.contentMode = .scaleAspectFit
        plusView.tintColor = #colorLiteral(red: 0.2980392157, green: 0.4588235294, blue: 0.6392156863, alpha: 1)
        plusView.image = #imageLiteral(resourceName: "add.png")
        stackView.addArrangedSubview(plusView)
        
      //  plusView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.25).isActive = true
     //   plusView.widthAnchor.constraint(equalTo: plusView.heightAnchor).isActive = true
    }
    private func addStackView(){
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fillEqually
        stackView.alignment = .center
        stackView.axis = .vertical
        addSubview(stackView)
        let constraints = NSLayoutConstraint.constraints(withNewVisualFormat: "H:|[stackView]|,V:|[stackView]|", dict: ["stackView" : stackView])
        addConstraints(constraints)
    }
    
    
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
