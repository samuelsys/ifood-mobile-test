//
//  TwitterApiCredentials.swift
//  TweetFeeling
//
//  Created by Samuel Furtado on 31/05/2018.
//  Copyright © 2018 Samuel Furtado. All rights reserved.
//

import Foundation

struct TwitterApiCredentials {
    
    struct Consumer {
        static let access = "JzSJ7TIAFrewY5qvHOavNzLYH"
        static let secretAcces = "ByxjgZvKg9a8cJ8WzfhllW4txCiZmVsyg71keW3tB8qrONKOf1"
    }
    
    enum Urls : String {
        case baseUrl = "https://api.twitter.com/1.1/statuses/"
        case timeline = "user_timeline.json"
        case update = "update.json"
        
        func getApiEndpoint () -> String {
            switch self {
            case .timeline:
                return Urls.baseUrl.rawValue + Urls.timeline.rawValue
            case .update:
                return Urls.baseUrl.rawValue + Urls.update.rawValue
            default:
                return Urls.baseUrl.rawValue
            }
        }
    }
}
