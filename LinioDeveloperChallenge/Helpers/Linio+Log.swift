//
//  Linio+Log.swift
//  LinioDeveloperChallenge
//
//  Created by guerrier on 1/22/19.
//  Copyright © 2019 guerra. All rights reserved.
//

import Foundation

func PrintLog(_ message: String, file: String = #file, function: String = #function, line: Int = #line) {
    #if DEBUG
    let className = file.components(separatedBy: "/").last
    print("File: \(className ?? "NoFileDetected"), Function: \(function), Line: \(line), Message: \(message)")
    #endif
}
