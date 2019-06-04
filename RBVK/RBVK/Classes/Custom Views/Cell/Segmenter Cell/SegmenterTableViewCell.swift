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
    
    func set(titles: [String]){
        segmentController.removeAllSegments()//очищаем
        //для каждого title enumerated для получения индекса
        titles.enumerated().forEach { (index, title) in
            segmentController.insertSegment(withTitle: title, at: index, animated: true)
        }
        segmentController.selectedSegmentIndex = 0
    }
    
    private func addTargets(){
        segmentController.addTarget(self, action: #selector(segmentControlChangedIndex), for: .valueChanged)
    }
    
    @objc private func segmentControlChangedIndex(sender: UISegmentedControl){
        indexChanged?(sender.selectedSegmentIndex)
    }
    
    
}
