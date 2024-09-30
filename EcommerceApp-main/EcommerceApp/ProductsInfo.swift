//
//  ProductsInfo.swift
//  EcommerceApp
//
//  Created by CSS on 28/06/22.
//


import UIKit

struct ProductsInfo {
    var proName: String
    var brand: String
    var price: String
    var review: String
    var proImg: UIImage
}

let shirtsProducts: [ProductsInfo] = [
    ProductsInfo(proName: "Rare Rabit Ascot", brand: "Arrow", price:"2000 $", review: "100 reviews", proImg:#imageLiteral(resourceName: "shirt1.jpeg")),
    ProductsInfo(proName: "Bombay shirt", brand: "Peter England", price:"3000 $", review: "150 reviews", proImg:#imageLiteral(resourceName: "shirt2.jpeg")),
    ProductsInfo(proName: "Black Berry Lure", brand: "Zodiac", price:"2500 $", review: "80 reviews", proImg:#imageLiteral(resourceName: "shirt3.jpeg")),
    ProductsInfo(proName: "Allen Solley", brand: "Park Avenue", price:"4000 $", review: "560 reviews", proImg:#imageLiteral(resourceName: "shirt4.jpeg")),
    ProductsInfo(proName: "Louis Philliphe", brand: "John Players", price:"1500 $", review: "250 reviews", proImg:#imageLiteral(resourceName: "shirt5.jpeg")),
    ProductsInfo(proName: "Checked White Shirt", brand: "Van Heusen", price:"5500 $", review: "800 reviews", proImg:#imageLiteral(resourceName: "shirt6.jpeg")),

]





