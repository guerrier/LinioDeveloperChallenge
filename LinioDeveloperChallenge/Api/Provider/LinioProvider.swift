//
//  LinioProvider.swift
//  LinioDeveloperChallenge
//
//  Created by guerrier on 1/22/19.
//  Copyright © 2019 guerra. All rights reserved.
//

import Foundation
import Moya

enum ApiLinio {
    case productsWishList
}

extension ApiLinio: TargetType {
    var baseURL: URL {
        return URL(string: Api.base_url)!
    }
    
    var path: String {
        switch self {
        case .productsWishList:
            return Api.products_wishlist
        }
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var sampleData: Data {
        return "".utf8Encoded
    }
    
    var task: Task {
        switch self {
        case .productsWishList:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .productsWishList:
            return ["Content-Type":"application/json"]
        }
    }
}
