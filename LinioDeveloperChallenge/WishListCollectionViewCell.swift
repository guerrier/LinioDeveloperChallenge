//
//  WishListCollectionViewCell.swift
//  LinioDeveloperChallenge
//
//  Created by guerrier on 1/24/19.
//  Copyright © 2019 guerra. All rights reserved.
//

import UIKit
import SDWebImage

class WishListCollectionViewCell: UICollectionViewCell{
    
    @IBOutlet weak var firstImageView: UIImageView!
    @IBOutlet weak var secondImageView: UIImageView!
    @IBOutlet weak var thirdImageView: UIImageView!
    @IBOutlet weak var wishListName: UILabel!
    @IBOutlet weak var wishListTotalProducts: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.contentView.layer.cornerRadius = 10.0
        self.contentView.clipsToBounds = true
    }
    
    func fillCellWith(wishList:WishListModel){
        self.wishListName.text = wishList.name
        self.wishListTotalProducts.text = String(format: "%d", (wishList.products?.count)!)
        var product = wishList.products![0]
        firstImageView.sd_setImage(with: URL(string: product.image ?? "."))
        product = wishList.products![1]
        secondImageView.sd_setImage(with: URL(string: product.image ?? "."))
        product = wishList.products![2]
        thirdImageView.sd_setImage(with: URL(string: product.image ?? "."))
    }
}
