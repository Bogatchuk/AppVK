//
//  Extension+NSLayoutConstraint.swift
//  RBVK
//
//  Created by Bogatchuk Roman on 5/27/19.
//  Copyright © 2019 Bogatchuk Roman. All rights reserved.
//

import UIKit

extension NSLayoutConstraint {
    //Aspect 1:1
    static func quadroAspect(on view: UIView) -> NSLayoutConstraint {
        return NSLayoutConstraint.init(item: view, attribute: .height, relatedBy: .equal, toItem: view, attribute: .width, multiplier: 1, constant: 0)
    }
    // withNewVisualFormat - withVisualFormat H and V в одной строке
    static func constraints(withNewVisualFormat vf: String, dict: [String: Any]) -> [NSLayoutConstraint]{
        let separatedArray = vf.split(separator: ",")
        switch separatedArray.count {
        case 1: return NSLayoutConstraint.constraints(withVisualFormat: "\(separatedArray[0])", options: [], metrics: nil, views: dict)
        case 2: return NSLayoutConstraint.constraints(withVisualFormat: "\(separatedArray[0])", options: [], metrics: nil, views: dict) + NSLayoutConstraint.constraints(withVisualFormat: "\(separatedArray[1])", options: [], metrics: nil, views: dict)
        default: return NSLayoutConstraint.constraints(withVisualFormat: "\(separatedArray[0])", options: [], metrics: nil, views: dict)
        }
    }
}
