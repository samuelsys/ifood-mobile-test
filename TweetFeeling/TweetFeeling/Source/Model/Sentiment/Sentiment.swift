//
//  Sentiment.swift
//  TweetFeeling
//
//  Created by Samuel Furtado on 02/06/2018.
//  Copyright © 2018 Samuel Furtado. All rights reserved.
//

import Foundation

enum Status {
    case happy
    case neutral
    case sad
}

struct Sentiment : Codable {
    var documentSentiment: DocumentSentiment?
    var status: Status?
    
    enum CodingKeys: String, CodingKey {
        case documentSentiment
    }
}

struct DocumentSentiment : Codable {
    var magnitude: Double?
    var score: Double?
    
    enum CodingKeys: String, CodingKey {
        case magnitude
        case score
    }
}
