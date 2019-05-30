//
//  SegmenterTableViewCell.swift
//  RBVK
//
//  Created by Bogatchuk Roman on 5/27/19.
//  Copyright © 2019 Bogatchuk Roman. All rights reserved.
//

import UIKit

class SegmenterTableViewCell: UITableViewCell, NibLoadable {
    
    
    @IBOutlet private weak var segmentController: UISegmentedControl!
    
    var indexChanged: ItemClosure<Int>?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        
        addTargets()
    }
    private func addTargets(){
        segmentController.addTarget(self, action: #selector(segmentControlChangedIndex), for: .valueChanged)
    }
    
    @objc private func segmentControlChangedIndex(sender: UISegmentedControl){
        indexChanged?(sender.selectedSegmentIndex)
    }
    
    
}
