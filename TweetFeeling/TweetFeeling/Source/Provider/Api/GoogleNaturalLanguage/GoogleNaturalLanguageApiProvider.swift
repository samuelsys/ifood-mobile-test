//
//  GoogleNaturalLanguageApiProvider.swift
//  TweetFeeling
//
//  Created by Samuel Furtado on 29/05/2018.
//  Copyright © 2018 Samuel Furtado. All rights reserved.
//

import Foundation

class GoogleNaturalLanguageApiProvider : GoogleNaturalLanguageApiProtocol {
    
    func analyzeSentiment(completion: @escaping NaturalLanguageCallback, message: String) {
        
        guard let serviceUrl = URL(string: GoogleNaturalLanguageAPICredentials.Urls.sentiment.getApiEndpoint()) else { return }
       
        var request = URLRequest(url: serviceUrl)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "content-type")
        
        var analyzeRequest = AnalyzeSentimentalRequest()
        var document = Document()
        
        document.type = "PLAIN_TEXT"
        document.content = message
        
        analyzeRequest.document = document
        
        do {
            request.httpBody = try JSONEncoder().encode(analyzeRequest)
            let session = URLSession.shared
            
            session.dataTask(with: request) { (data, response, error) in
                if let error = error { print(error)}
                else if let data = data {
                    completion(data)
                }
            }.resume()
        } catch { print(error)}
    }
}
