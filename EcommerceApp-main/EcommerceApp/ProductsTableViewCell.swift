//
//  ProductsTableViewCell.swift
//  EcommerceApp
//
//  Created by CSS on 28/06/22.
//

import UIKit

class ProductsTableViewCell:  UITableViewCell {

    @IBOutlet weak var shirtImage: UIImageView!
    
    
    @IBOutlet weak var shirtName: UILabel!
    

    @IBOutlet weak var shirtBrand: UILabel!

    @IBOutlet weak var shirtPrice: UILabel!
  
    @IBOutlet weak var shirtReview: UILabel!
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    

}


