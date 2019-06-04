//
//  StorageManager.swift
//  RBVK
//
//  Created by Bogatchuk Roman on 6/4/19.
//  Copyright © 2019 Bogatchuk Roman. All rights reserved.
//

import UIKit
import FirebaseStorage

class StorageManager {
    static let shared = StorageManager()
    private init (){}
    
    private let sourceRef = Storage.storage().reference()
    
    func upload(photo: UIImage,by model: RegisterModel, closure: VoidClosure? = nil){
        //сжимаем фото в 0.5 раз
        guard let data = photo.jpegData(compressionQuality: 0.5) else {return}
        sourceRef.child(Kays.avatar.rawValue).child(model.userId).putData(data, metadata: nil) { (metadata, error) in
            closure?()
        }
        
    }
    
    //download avatar
    func loadAvatarUrl(for model: RegisterModel, closure: @escaping OptionalItemClosure<URL>){
        sourceRef.child(Kays.avatar.rawValue).child(model.userId).downloadURL { (url, error) in
            closure(url)
        }
    }
}

extension StorageManager {
    private enum Kays: String {
        case avatar
    }
}
