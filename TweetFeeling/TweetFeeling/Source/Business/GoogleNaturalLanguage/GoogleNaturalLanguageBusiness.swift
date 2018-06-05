//
//  GoogleNaturalLanguageBusiness.swift
//  TweetFeeling
//
//  Created by Samuel Furtado on 29/05/2018.
//  Copyright © 2018 Samuel Furtado. All rights reserved.
//

import Foundation
import Reachability

typealias NaturalLanguageResultCallback = (@escaping () throws -> Sentiment?) -> Void

class GoogleNaturalLanguageBusiness {
    
    var provider: GoogleNaturalLanguageApiProvider = GoogleNaturalLanguageApiProvider()
    var reachability = Reachability()
    
    // Analyze Sentiment
    //
    // Params
    //  message: message to analyze
    
    func analyzeSentiment(completion: @escaping NaturalLanguageResultCallback, message: String) {
        
        if reachability?.connection == Reachability.Connection.none {
            completion { throw BusinessError.offlineMode }
            return
        }
        
        provider.analyzeSentiment(completion: { [weak self] (result) in
             guard let _self = self else { return }
            do {
                guard let sentimentResult = result else { return }
                
                guard let sentiment = try? JSONDecoder().decode(Sentiment.self, from:sentimentResult) else {
                    throw BusinessError.parse
                }
                
                let sentimenttt = _self.setSentimentStatus(sentiment: sentiment)
                
                completion { sentimenttt }
            } catch let error {
                completion { throw error }
            }
        }, message: message)
    }
    
    func setSentimentStatus (sentiment: Sentiment) -> Sentiment {
        var newSentiment = Sentiment()
        
        if let score = sentiment.documentSentiment?.score {
            
            newSentiment.status = Status.happy
            
            if score < Double(0.0) {
                newSentiment.status = Status.sad
            } else if score >= Double(0.0) && score < Double(0.5) {
                newSentiment.status = Status.neutral
            }
        }
        return newSentiment
    }
}
