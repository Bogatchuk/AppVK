//
//  TextField.swift
//  RBVK
//
//  Created by Bogatchuk Roman on 6/5/19.
//  Copyright © 2019 Bogatchuk Roman. All rights reserved.
//

import UIKit

class TextField: UITextField {
  private let leftSpacing: CGFloat = 16
  
  override func didMoveToSuperview() {
    super.didMoveToSuperview()
    
    backgroundColor = .white
  }
  private func defaultRect(for bounds: CGRect) -> CGRect{
    return CGRect.init(x: leftSpacing, y: 0, width: bounds.width - leftSpacing, height: bounds.height)
  }
  
  override func textRect(forBounds bounds: CGRect) -> CGRect {
    return defaultRect(for: bounds)
  }
  override func editingRect(forBounds bounds: CGRect) -> CGRect {
    return defaultRect(for: bounds)
  }
  override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
    return defaultRect(for: bounds)
  }
}
