//
//  FavoritesViewController+UICollectionViewDataSource.swift
//  LinioDeveloperChallenge
//
//  Created by guerrier on 1/24/19.
//  Copyright © 2019 guerra. All rights reserved.
//

import UIKit

extension FavoritesViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return sections
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        var numberOfItems = 0
        switch section {
        case 0:
            numberOfItems = wishLists.count
            break
        case 1:
            numberOfItems = products.count
            break
        default:
            numberOfItems = 0
        }
        return numberOfItems
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        var collectionCell:UICollectionViewCell
        
        switch indexPath.section {
        case 0:
            collectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: "wishListCell", for: indexPath)
            let wishList = wishLists[indexPath.item]
            (collectionCell as! WishListCollectionViewCell).fillCellWith(wishList: wishList)
            break
        case 1:
            collectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: "productCell", for: indexPath)
            let product = products[indexPath.item]
            (collectionCell as! ProductCollectionViewCell).fillCellWith(product: product)
            break
        default:
            collectionCell = UICollectionViewCell()
        }
        
        return collectionCell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let header = (favoritesColletionViewController.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "WishListHeader", for: indexPath) as? WishListHeaderCollectionView) else{
            return UICollectionReusableView()
        }
        
        switch indexPath.section {
        case 1:
            header.title.text = String(format: "Mis Favoritos(%d)", products.count)
            return header
            break
        default:
            return UICollectionReusableView()
        }
        
    }
}
