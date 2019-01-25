//
//  ProductCollectionViewCell.swift
//  LinioDeveloperChallenge
//
//  Created by guerrier on 1/24/19.
//  Copyright © 2019 guerra. All rights reserved.
//

import UIKit
import SDWebImage

class ProductCollectionViewCell: UICollectionViewCell{
    
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var badgesView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.contentView.layer.cornerRadius = 10.0
        self.contentView.clipsToBounds = true
    }
    
    func fillCellWith(product:ProductModel){
        self.productImageView.sd_setImage(with: URL(string: product.image ?? "."))
    }
}
