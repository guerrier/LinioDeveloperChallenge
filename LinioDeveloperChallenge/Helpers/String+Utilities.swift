//
//  String+Utilities.swift
//  LinioDeveloperChallenge
//
//  Created by guerrier on 1/22/19.
//  Copyright © 2019 guerra. All rights reserved.
//

import UIKit

extension String {
    var urlEscaped: String {
        return addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
    }
    
    var utf8Encoded: Data {
        return data(using: .utf8)!
    }
    
    func convertToJsonDictonary() -> [String:Any]? {
        let jsonData = self.data(using: .utf8)
            .flatMap{try? JSONSerialization.jsonObject(with: $0, options: [])}
            .flatMap{$0 as? [String: Any]}
        
        return jsonData
    }
    
    func convertToJsonArray() -> [Dictionary<String,Any>]? {
        let jsonData = self.data(using: .utf8)
            .flatMap{try? JSONSerialization.jsonObject(with: $0, options: [])}
            .flatMap{$0 as? [Dictionary<String,Any>]}
        
        return jsonData
    }
    
    
    func convertToDate() -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        dateFormatter.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
        let date = dateFormatter.date(from:self)!
        let calendar = Calendar.current
        let components = calendar.dateComponents([.year, .month, .day, .hour], from: date)
        let finalDate = calendar.date(from:components)

        return finalDate
    }
}
