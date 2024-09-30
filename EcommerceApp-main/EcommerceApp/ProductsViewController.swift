//
//  ProductsViewController.swift
//  EcommerceApp
//
//  Created by CSS on 28/06/22.
//

import UIKit
import Alamofire

class ProductsViewController: UIViewController {

    
    
    @IBOutlet weak var proLbl: UILabel!
    
    
    @IBOutlet weak var proTable: UITableView!
    var prod = ""
    var arr: [Post] = []
    var space = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        //print(space)
        space = prod.replacingOccurrences(of: " ", with: "%20")
        guard let url = URL(string: "https://fakestoreapi.com/products/category/\(space)") else {
            return
        }
        AF.request(url).responseDecodable(of: [Post].self) { (response) in
            guard let data = response.value else { return }
            self.arr = data
            DispatchQueue.main.async(){
                self.proTable.reloadData()

            }
        }
        

//        let task = URLSession.shared.dataTask(with: url){
//            data, response, error in
//
////            if let data = data,let ans = String(data: data, encoding: .utf8){
////                print(ans)
////
////            }
//            let decoder = JSONDecoder()
//
//                    if let data = data{
//                        do{
//                            self.arr = try decoder.decode([Post].self, from: data)
//                            print("the products is \(self.arr)")
////                            tasks.forEach{ i in
////                                print(i.title)
////                            }
//                            //print(tasks)
//                            DispatchQueue.main.async(){
//                                self.proTable.reloadData()
//
//                            }
//                        }catch{
//                            print(error)
//                        }
//                    }
//        }
//
//        task.resume()
        proLbl.text = prod
        
        proTable.dataSource = self
        proTable.delegate = self
        
        

        // Do any additional setup after loading the view.
    }
    
}
    



extension ProductsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return shirtsProducts.count
        //return 25
        return arr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = proTable.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ProductsTableViewCell
//        cell.shirtName.text = shirtsProducts[indexPath.row].proName
//        cell.shirtBrand.text = shirtsProducts[indexPath.row].brand
//        cell.shirtPrice.text = shirtsProducts[indexPath.row].price
//        cell.shirtReview.text = shirtsProducts[indexPath.row].review
//        cell.shirtImage.image = shirtsProducts[indexPath.row].proImg
        //print(arr)
        cell.shirtName.text = arr[indexPath.row].title
        cell.shirtBrand.text = arr[indexPath.row].category
        cell.shirtPrice.text = "\(arr[indexPath.row].price)"
        cell.shirtReview.text = "\(arr[indexPath.row].rating.rate)"
        //print(arr[indexPath.row].image)
        //let img = UIImage(named: arr[indexPath.row].image)
        cell.shirtImage.downloaded(from: "\(arr[indexPath.row].image)")
        return cell
    }
     func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        CGFloat(200)
    }
    
}


extension UIImageView {
    func downloaded(from url: URL, contentMode mode: ContentMode = .scaleAspectFit) {
        contentMode = mode
        AF.request(url).response { dataResponse in
            guard
                let httpURLResponse = dataResponse.response, httpURLResponse.statusCode == 200,
                let mimeType = dataResponse.response?.mimeType, mimeType.hasPrefix("image"),
                let data = dataResponse.data, dataResponse.error == nil,
                let image = UIImage(data: data)
                else { return }
            //print("the image is \(image)")
            DispatchQueue.main.async() { [weak self] in
                self?.image = image
            }
            
        }
        
//        URLSession.shared.dataTask(with: url) { data, response, error in
//            print("the image data is \(data)")
//            guard
//                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
//                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
//                let data = data, error == nil,
//                let image = UIImage(data: data)
//                else { return }
//
//            DispatchQueue.main.async() { [weak self] in
//                self?.image = image
//            }
//        }.resume()
    }
    func downloaded(from link: String, contentMode mode: ContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
}
