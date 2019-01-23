//
//  User.swift
//  LinioDeveloperChallenge
//
//  Created by guerrier on 1/17/19.
//  Copyright © 2019 guerra. All rights reserved.
//

import Foundation
import Mapper

public class User:Mappable{
    public let name:String?
    public let email:String?
    public let linioId:String?
    
    public init(name:String, email:String, linioId:String){
        self.name = name
        self.email = email
        self.linioId = linioId
    }
    
    required public init(map: Mapper) throws{
        name = map.optionalFrom("name")
        email = map.optionalFrom("email")
        linioId = map.optionalFrom("linioId")
    }
}
