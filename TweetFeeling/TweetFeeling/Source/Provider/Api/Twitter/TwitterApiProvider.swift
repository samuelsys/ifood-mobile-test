//
//  TwitterApiProvider.swift
//  TweetFeeling
//
//  Created by Samuel Furtado on 29/05/2018.
//  Copyright © 2018 Samuel Furtado. All rights reserved.
//

import Foundation
import OhhAuth
class TwitterApiProvider : TwitterApiProtocol {

    let consumerCredentials = (key: TwitterApiCredentials.Consumer.access, secret: TwitterApiCredentials.Consumer.secretAcces)
    
    func fetchTimelineTweets(completion: @escaping TwitterCallback, userAccessToken: String, userAccessSecretToken: String) {
        let userCredentials = (key: userAccessToken, secret: userAccessSecretToken)
        var req = URLRequest(url: URL(string: TwitterApiCredentials.Urls.timeline.getApiEndpoint())!)
        req.oAuthSign(method: "GET", consumerCredentials: consumerCredentials, userCredentials: userCredentials)
        let task = URLSession(configuration: .ephemeral).dataTask(with: req) { (data, response, error) in
            if let error = error { print(error)}
            else if let data = data {
                completion(data)
            }
        }
        task.resume()
    }
}
