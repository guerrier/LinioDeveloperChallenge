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
    
    let badgeSize:CGFloat = 30.0
    var badges:[UIImageView]?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.contentView.layer.cornerRadius = 10.0
        self.contentView.clipsToBounds = true
    }
    
    func fillCellWith(product:ProductModel){
        self.productImageView.sd_setImage(with: URL(string: product.image ?? "."))
        badges = [UIImageView]()
        
        if product.linioPlusLevel! > 0 {
            if product.linioPlusLevel == 1{
                createBadge(image: #imageLiteral(resourceName: "linioPlus"))
            }else if product.linioPlusLevel == 2{
                createBadge(image: #imageLiteral(resourceName: "linioPlus48"))
            }
        }
        
        if product.conditionType == "refurbished" {
            createBadge(image: #imageLiteral(resourceName: "refurbished"))
        }else if product.conditionType == "new" {
            createBadge(image: #imageLiteral(resourceName: "new"))
        }
        
        if product.imported!{
            createBadge(image: #imageLiteral(resourceName: "imported"))
        }
        
        if product.freeShipping!{
            createBadge(image: #imageLiteral(resourceName: "freeShipping"))
        }
        
        var i = 0
        for badge in badges!{
            var frameBadge = badge.frame
            frameBadge.origin.y = badgeSize * CGFloat(integerLiteral: i)
            badge.frame = frameBadge
            badgesView.addSubview(badge)
            i = i + 1
        }
        
    }
    
    func createBadge(image:UIImage){
        let badge = UIImageView(frame: CGRect(x: 0.0, y: 0.0, width: badgeSize, height: badgeSize))
        badge.image = image
        badges?.append(badge)
    }
}
