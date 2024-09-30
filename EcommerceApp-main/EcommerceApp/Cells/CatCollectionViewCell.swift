//
//  CatCollectionViewCell.swift
//  EcommerceApp
//
//  Created by CSS on 03/07/22.
//

import UIKit

class CatCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var lbl1: UILabel!
    
    @IBOutlet weak var lbl2: UILabel!
    
    func setup(with cat: Category) {
        
        lbl1.text = cat.title
    }
}
