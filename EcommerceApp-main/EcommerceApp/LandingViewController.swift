//
//  LandingViewController.swift
//  EcommerceApp
//
//  Created by CSS on 29/06/22.
//

import UIKit
import Alamofire
typealias LanList = [String]
class LandingViewController: UIViewController {
    var arr: LanList = []
    
    
    
    @IBOutlet weak var discCollectionView: UICollectionView!
    
    @IBOutlet weak var catCollectionView: UICollectionView!
    @IBOutlet weak var myImgSlide: UIPageControl!
    @IBOutlet weak var lanCollectionView: UICollectionView!
//    var currentCellindex = 0

    var slideImg = ["saran1","saran6","saran5","saran1","saran2","saran4"]
    var timer = Timer()
    var counter = 0


    override func viewDidLoad() {
        super.viewDidLoad()
        lanCollectionView.dataSource = self
        lanCollectionView.delegate = self
        
        catCollectionView.dataSource = self
        catCollectionView.delegate = self
        catCollectionView.collectionViewLayout = UICollectionViewFlowLayout()
        
        discCollectionView.dataSource = self
        discCollectionView.delegate = self
        discCollectionView.collectionViewLayout = UICollectionViewFlowLayout()
        guard let url = URL(string: "https://fakestoreapi.com/products/categories") else{
            return
        }
        AF.request(url).responseDecodable(of: LanList.self) { (response) in
            guard let data = response.value else { return }
            self.arr = data
            DispatchQueue.main.async(){
                self.catCollectionView.reloadData()

            }
        }
//        let task = URLSession.shared.dataTask(with: url){
//            data, response, error in
//            let decoder = JSONDecoder()
//                    if let data = data{
//                        print(data)
//                        do{
//
//                            self.arr = try decoder.decode(LanList.self, from: data)
//                            print("the data is \(self.arr)")
//
//                            DispatchQueue.main.async(){
//                                self.catCollectionView.reloadData()
//
//                            }
//                        }catch{
//                            print(error)
//                        }
//                    }
//        }
//        task.resume()
        
        
        
        myImgSlide.numberOfPages = slideImg.count
        myImgSlide.currentPage = 0
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(changeImage), userInfo: nil, repeats: true)

    }
    @objc func changeImage() {
        if counter < slideImg.count {
//            let index = IndexPath.init(item: counter, section: 0)
//            self.lanCollectionView.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
            counter += 1
            myImgSlide.currentPage = counter

        } else {
            counter = 0
//            let index = IndexPath.init(item: counter, section: 0)
//            self.lanCollectionView.scrollToItem(at: index, at: .centeredHorizontally, animated: false)
            myImgSlide.currentPage = counter
            counter = 1
        }

    }
    


    

}

extension LandingViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if (collectionView == lanCollectionView) {
            return slideImg.count
        } else if (collectionView == catCollectionView) {
            //return categories.count
            return arr.count
        }
        return discounts.count
        
        
        
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == catCollectionView {
            print(categories[indexPath.row].title)
                    let productViewController = storyboard?.instantiateViewController(withIdentifier: "productsViewController") as! ProductsViewController
            
                    productViewController.prod = arr[indexPath.row]
            self.navigationController?.pushViewController(productViewController, animated: true)
            
        }
        

    }
    

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = lanCollectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! LandingCollectionViewCell
        cell.lanImg.image = UIImage(named: slideImg[indexPath.row])
        if collectionView == catCollectionView {
            let cell1 = catCollectionView.dequeueReusableCell(withReuseIdentifier: "cell1", for: indexPath) as! CatCollectionViewCell
            //cell1.setup(with: categories[indexPath.row])
            //cell1.setup(with: arr[indexPath.row])
            cell1.lbl1.text = arr[indexPath.row]
            return cell1
            
        } else if collectionView == discCollectionView {
            let cell2 = discCollectionView.dequeueReusableCell(withReuseIdentifier: "cell2", for: indexPath) as! DiscountCollectionViewCell
            cell2.setup(with: discounts[indexPath.row])
            return cell2
        }
        return cell
        
        
        

    }
}
extension LandingViewController: UICollectionViewDelegateFlowLayout {
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
//    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = lanCollectionView.frame.size
        if collectionView == catCollectionView {
            return CGSize(width: 186, height: 57)
            
        } else if collectionView == discCollectionView {
            return CGSize(width: 200, height: 220)
            
        }
        return CGSize(width: size.width, height: size.height)
    }
    
}











