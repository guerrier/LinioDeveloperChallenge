//
//  WishList.swift
//  LinioDeveloperChallenge
//
//  Created by guerrier on 1/17/19.
//  Copyright © 2019 guerra. All rights reserved.
//

import Foundation
import Mapper

public class WishListModel:Mappable{
    public let idWishList:NSInteger?
    public let name:String?
    public let description:String?
    public let defaultWishList:Bool?
    public let owner:User?
    public let createdAt:Date?
    public let visibility:String?
    public let products:[ProductModel]?
    
    public init(idWishList:NSInteger, name:String, description:String, defaultWishList:Bool, owner:User, createdAt:Date, visibility:String, products:[ProductModel]){
        self.idWishList = idWishList
        self.name = name
        self.description = description
        self.defaultWishList = defaultWishList
        self.owner = owner
        self.createdAt = createdAt
        self.visibility = visibility
        self.products = products
    }
    
    required public init(map: Mapper) throws{
        idWishList = map.optionalFrom("id")
        name = map.optionalFrom("name")
        description = map.optionalFrom("description")
        defaultWishList = map.optionalFrom("default")
        owner = map.optionalFrom("owner")
        let isoDate:String? = map.optionalFrom("createdAt")
        createdAt = isoDate?.convertToDate()
        visibility = map.optionalFrom("visibility")
        let prodsArr:[Dictionary<String, Any>] = map.optionalFrom("products", transformation: {productsJson in
            var products:[Dictionary<String, Any>] = [Dictionary<String, Any>]()
            let productsDic = productsJson as! Dictionary<String, Any>

            for (key, value) in productsDic{
                products.append(value as! Dictionary<String, Any>)
            }
            return products
        }) ?? []
        products = ProductModel.from(prodsArr as NSArray)
    }
}
