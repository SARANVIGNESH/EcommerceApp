//
//  ViewController.swift
//  EcommerceApp
//
//  Created by CSS on 27/06/22.
//

import UIKit
import Alamofire
typealias CategoryList = [String]
class ViewController: UIViewController {
    
    
    var arr: CategoryList = []
    
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let url = URL(string: "https://fakestoreapi.com/products/categories") else{
            return
        }
        AF.request(url).responseDecodable(of: CategoryList.self) { (response) in
            guard let data = response.value else { return }
            self.arr = data
            DispatchQueue.main.async(){
                self.collectionView.reloadData()

            }
        }
//        let task = URLSession.shared.dataTask(with: url){
//            data, response, error in
//            let decoder = JSONDecoder()
//
//                    if let data = data{
//                        do{
//                            self.arr = try decoder.decode(CategoryList.self, from: data)
//                            //print("the array is \(self.arr)")
//                            //print(tasks)
//
//                            DispatchQueue.main.async(){
//                                self.collectionView.reloadData()
//
//                            }
//                        }catch{
//                            print(error)
//                        }
//                    }
//        }
//
//        task.resume()

        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.collectionViewLayout = UICollectionViewFlowLayout()

     }
    
}





extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //return categories.count
        return arr.count
        
        
        
        
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "EcomCollectionViewCell", for: indexPath) as! EcomCollectionViewCell
//        cell.setup(with: categories[indexPath.row])
        //print(ans[indexPath.row])
        cell.ecomTitle.text = arr[indexPath.row]
        print(arr)
        
        return cell
    }
    
    
    
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200, height: 300)
        
    }
    
}

extension ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //print(categories[indexPath.row].title)
        let productViewController = storyboard?.instantiateViewController(withIdentifier: "productsViewController") as! ProductsViewController
        productViewController.prod = arr[indexPath.row]
        self.navigationController?.pushViewController(productViewController, animated: true)
    }
}

