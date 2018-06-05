//
//  HomeManager.swift
//  TweetFeeling
//
//  Created by Samuel Furtado on 29/05/2018.
//  Copyright © 2018 Samuel Furtado. All rights reserved.
//

import UIKit

class HomeManager: BaseManager {
    
    private let twitterBusiness = TwitterBusiness()
    private let googleNaturalLanguageBusiness = GoogleNaturalLanguageBusiness()
    
    //
    // Call a list of an user tweets
    //
    // Params
    //  accessToken: user access token
    //  accessSecretToken: user access Secret Token
    //
    func fetchTimelineTweets(completion: @escaping TweetResultCallback, accessToken: String, accessSecretToken: String) {
        self.operations.addOperation {
            self.twitterBusiness.fetchTimelineTweets(completion: { (result) in
                OperationQueue.main.addOperation({
                    completion(result)
                })
            }, accessToken: accessToken, accessSecretToken: accessSecretToken)
        }
    }
    
    //
    // Analyze Sentiment
    //
    // Params
    //  message: message to analyze
    //
    func analyzeSentiment(completion: @escaping NaturalLanguageResultCallback, message: String) {
        self.operations.addOperation {
            self.googleNaturalLanguageBusiness.analyzeSentiment(completion: { (result) in
                OperationQueue.main.addOperation({
                    completion(result)
                })
            }, message: message)
        }
    }
}
