//
//  UserHeaderView.swift
//  RBVK
//
//  Created by Bogatchuk Roman on 6/5/19.
//  Copyright © 2019 Bogatchuk Roman. All rights reserved.
//

import UIKit

class UserHeaderView: UIView, NibLoadable{
  
  @IBOutlet private weak var avatarView: UIImageView!
  @IBOutlet private weak var userNameLabel: UILabel!
  
  
  override func awakeFromNib() {
    super.awakeFromNib()
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    avatarView.round()
  }
  

}
