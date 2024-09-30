//
//  FetchData.swift
//  EcommerceApp
//
//  Created by CSS on 04/07/22.
//

//import Foundation


//func callAPI(){
//    guard let url = URL(string: "https://fakestoreapi.com/products/categories") else{
//        return
//    }
//
//
//    let task = URLSession.shared.dataTask(with: url){
//        data, response, error in
//
//        if let data = data, let string = String(data: data, encoding: .utf8){
//            print(string)
//        }
//    }
//
//    task.resume()
//}
import Foundation

struct Post:Decodable{

    var title:String

    var price:Float

    var description:String

    var category:String

    var image:String

    var rating:Rating

}

struct Rating:Decodable{

    var rate:Float

    var count:Int

}









