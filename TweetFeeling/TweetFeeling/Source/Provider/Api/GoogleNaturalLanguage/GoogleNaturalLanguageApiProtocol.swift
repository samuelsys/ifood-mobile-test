//
//  GoogleNaturalLanguageApiProtocol.swift
//  TweetFeeling
//
//  Created by Samuel Furtado on 29/05/2018.
//  Copyright © 2018 Samuel Furtado. All rights reserved.
//

import Foundation

typealias NaturalLanguageCallback = (Data?) -> Void

protocol GoogleNaturalLanguageApiProtocol {
    
    //
    // Call Sentimental API
    //
    // Params
    //  message: message to be analyzed
    //
    
    func analyzeSentiment(completion: @escaping NaturalLanguageCallback, message: String)
}
