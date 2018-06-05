//
//  Tweet.swift
//  TweetFeeling
//
//  Created by Samuel Furtado on 31/05/2018.
//  Copyright © 2018 Samuel Furtado. All rights reserved.
//

import Foundation

struct Tweet : Codable {
    var text: String?
    var createdAt: String?
    
    enum CodingKeys: String, CodingKey {
        case text = "text"
        case createdAt =  "created_at"
    }
}
