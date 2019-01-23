//
//  Product.swift
//  LinioDeveloperChallenge
//
//  Created by guerrier on 1/17/19.
//  Copyright © 2019 guerra. All rights reserved.
//

import Foundation
import Mapper

public class ProductModel:Mappable{
    public let idProduct:String?
    public let name:String?
    public let wishListPrice:Double?
    public let slug:String?
    public let url:String?
    public let image:String?
    public let linioPlusLevel:NSInteger?
    public let conditionType:String?
    public let freeShipping: Bool?
    public let imported:Bool?
    public let active:Bool?
    
    public init(idProduct:String, name:String, wishListPrice:Double, slug: String, url: String, image:String, linioPlusLevel:NSInteger, conditionType:String, freeShipping:Bool, imported:Bool, active:Bool){
        self.idProduct = idProduct
        self.name = name
        self.wishListPrice = wishListPrice
        self.slug = slug
        self.url = url
        self.image = image
        self.linioPlusLevel = linioPlusLevel
        self.conditionType = conditionType
        self.freeShipping = freeShipping
        self.imported = imported
        self.active = active
    }
    
    required public init(map: Mapper) throws{
        idProduct = map.optionalFrom("id")
        name = map.optionalFrom("name")
        wishListPrice = map.optionalFrom("wishListPrice")
        slug = map.optionalFrom("slug")
        url = map.optionalFrom("url")
        image = map.optionalFrom("image")
        linioPlusLevel = map.optionalFrom("linioPlusLevel")
        conditionType = map.optionalFrom("conditionType")
        freeShipping = map.optionalFrom("freeShipping")
        imported = map.optionalFrom("imported")
        active = map.optionalFrom("active")
    }
}
