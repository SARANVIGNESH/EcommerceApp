//
//  Discounts.swift
//  EcommerceApp
//
//  Created by CSS on 03/07/22.
//



import UIKit

struct Discounts {
    let image: UIImage
    let title: String
    let descrip: String
    let rate: String
}

let discounts: [Discounts] = [
    
    Discounts(image:#imageLiteral(resourceName: "Watches.jpeg") , title: "Watches", descrip: "Coloufull watches", rate: "$1 8̶6̶"),
    Discounts(image:#imageLiteral(resourceName: "Shoes.jpeg"),title: "Shoes", descrip: "Colourfull sneakers", rate: "$78 8̶0̶"),
    Discounts(image: #imageLiteral(resourceName: "Shirts.jpeg"), title: "Shirts", descrip: "Fresh prints of Bel-Air", rate: "$89 1̶0̶0̶"),
    Discounts(image: #imageLiteral(resourceName: "Pants.jpeg") ,title: "Pants", descrip: "Colourfull pants", rate: "$56 7̶8̶"),
    Discounts(image: #imageLiteral(resourceName: "Shorts.jpg") , title: "Shorts", descrip: "Colourfull shorts", rate: "$90 1̶0̶7̶"),
    Discounts(image:#imageLiteral(resourceName: "Blazers.jpeg") , title: "Blazers", descrip: "Colourfull blazers", rate: "$60 8̶9̶")
    
    
]


