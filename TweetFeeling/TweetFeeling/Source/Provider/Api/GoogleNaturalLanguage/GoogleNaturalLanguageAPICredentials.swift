//
//  GoogleNaturalLanguageAPICredentials.swift
//  TweetFeeling
//
//  Created by Samuel Furtado on 02/06/2018.
//  Copyright © 2018 Samuel Furtado. All rights reserved.
//

import Foundation

struct GoogleNaturalLanguageAPICredentials {
    
    static let privateKey = "AIzaSyBHnBwtavdKgkix9KWBz9DsXulkYlwWL2s"
    
    enum Urls : String {
        case baseUrl = "https://language.googleapis.com/v1/documents:"
        case sentiment = "analyzeSentiment"
        
        func getApiEndpoint () -> String {
            switch self {
            case .sentiment:
                return Urls.baseUrl.rawValue + Urls.sentiment.rawValue + "?key=" + GoogleNaturalLanguageAPICredentials.privateKey
            default:
                return Urls.baseUrl.rawValue
            }
        }
    }
}
