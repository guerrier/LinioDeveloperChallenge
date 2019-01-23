//
//  ApiManager.swift
//  LinioDeveloperChallenge
//
//  Created by guerrier on 1/22/19.
//  Copyright © 2019 guerra. All rights reserved.
//

import Foundation
import Moya

class ApiManager: NSObject {
    fileprivate static var _sharedApi: ApiManager!
    let provider = MoyaProvider<ApiLinio>()
    
    class func sharedApi() -> ApiManager {
        if _sharedApi == nil {
            _sharedApi = ApiManager()
        }
        return _sharedApi
    }
    
    func getFavoritesProducts(_ completion : @escaping(_ success: Bool, _ object: Any?) -> Void) {
        provider.request(.productsWishList) { (result) in
            switch result {
            case .success(let response):
                if response.statusCode == 200 {
                    guard let str_response = try? response.mapString() else { return completion(false, nil) }
                    guard let data_json = str_response.convertToJsonArray() else { return completion(false, nil) }
                    
                    guard let model = WishListModel.from((data_json as NSArray)) else {
                        return completion(false, nil)
                    }
                    
                    completion(true, model)
                } else {
                    completion(false, nil)
                }
            case .failure(let error):
                PrintLog(error.errorDescription ?? "unknown error")
                completion(false, nil)
            }
        }
    }
}
