//
//  AnalyzeSentimentalRequest.swift
//  TweetFeeling
//
//  Created by Samuel Furtado on 02/06/2018.
//  Copyright © 2018 Samuel Furtado. All rights reserved.
//

import Foundation

struct Document : Codable {
    var type: String?
    var content: String?
    
    enum CodingKeys: String, CodingKey {
        case type = "type"
        case content = "content"
    }
}

struct AnalyzeSentimentalRequest : Codable {
    var document: Document?
    
    enum CodingKeys: String, CodingKey {
        case document
    }
}
