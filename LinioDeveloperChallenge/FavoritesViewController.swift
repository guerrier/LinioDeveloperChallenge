//
//  ViewController.swift
//  LinioDeveloperChallenge
//
//  Created by guerrier on 1/17/19.
//  Copyright © 2019 guerra. All rights reserved.
//

import UIKit

class FavoritesViewController: UIViewController, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var favoritesColletionViewController: UICollectionView!
    let sections = 2
    
    var wishLists = [WishListModel]()
    var products = [ProductModel]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        favoritesColletionViewController.register(WishListHeaderCollectionView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader , withReuseIdentifier: "WishListHeader")

        getFavoritesProducts()
    }
    
    func getFavoritesProducts() {
        
        ApiManager.sharedApi().getFavoritesProducts { [weak self] (success, object) in
            guard let strongSelf = self else { return }
            
            if success {
                if let model = object as? [WishListModel] {
                    strongSelf.wishLists = model
                    strongSelf.products = [ProductModel]()
                    for wishList in strongSelf.wishLists{
                        strongSelf.products.append(contentsOf: wishList.products ?? [])
                    }
                    strongSelf.favoritesColletionViewController.reloadData()
                } else {
                }
            } else {
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let padding: CGFloat =  50
        let collectionViewSize = collectionView.frame.size.width - padding
        
        return CGSize(width: collectionViewSize/2, height: collectionViewSize/2)
    }

}

