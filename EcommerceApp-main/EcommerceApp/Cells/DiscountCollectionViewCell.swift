//
//  DiscountCollectionViewCell.swift
//  EcommerceApp
//
//  Created by CSS on 03/07/22.
//

import UIKit

class DiscountCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var discImg: UIImageView!
    
    @IBOutlet weak var discName: UILabel!
    
    
    @IBOutlet weak var discDescrip: UILabel!
    
    
    @IBOutlet weak var discRate: UILabel!
    func setup(with dis: Discounts) {
        discImg.image = dis.image
        discName.text = dis.title
        discDescrip.text = dis.descrip
        discRate.text = dis.rate
        
        //lbl1.text = cat.title
    }
    
    
}
