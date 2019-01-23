//
//  ViewController.swift
//  LinioDeveloperChallenge
//
//  Created by guerrier on 1/17/19.
//  Copyright © 2019 guerra. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var products = [WishListModel]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        getFavoritesProducts()
    }
    
    func getFavoritesProducts() {
        
        ApiManager.sharedApi().getFavoritesProducts { [weak self] (success, object) in
            guard let strongSelf = self else { return }
            
            if success {
                if let model = object as? [WishListModel] {
                    strongSelf.products = model
                    let product = strongSelf.products[0].products?[0] as! ProductModel
                    print("ViewController product = \(product)")
                    
//                    strongSelf.productsCollectionView.reloadData()
                } else {
                }
            } else {
            }
        }
    }


}

