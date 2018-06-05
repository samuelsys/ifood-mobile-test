//
//  BusinessError.swift
//  TweetFeeling
//
//  Created by Samuel Furtado on 31/05/2018.
//  Copyright © 2018 Samuel Furtado. All rights reserved.
//

import Foundation

enum BusinessError: Error {
    case offlineMode
    case generic
    case parse
}
