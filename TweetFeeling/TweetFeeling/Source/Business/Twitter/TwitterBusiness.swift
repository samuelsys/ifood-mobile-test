//
//  TwitterBusiness.swift
//  TweetFeeling
//
//  Created by Samuel Furtado on 29/05/2018.
//  Copyright © 2018 Samuel Furtado. All rights reserved.
//

import Foundation
import Reachability

typealias TweetResultCallback = (@escaping () throws -> [Tweet]?) -> Void

struct TwitterBusiness {
    
    var provider: TwitterApiProtocol = TwitterApiProvider()
    var reachability = Reachability()
    
    // Call a list of an user tweets
    //
    // Params
    //  accessToken: user access token
    //  accessSecretToken: user access Secret Token
    
    func fetchTimelineTweets(completion: @escaping TweetResultCallback, accessToken: String, accessSecretToken: String) {
        
        if reachability?.connection == Reachability.Connection.none {
            completion { throw BusinessError.offlineMode }
            return
        }
        
        provider.fetchTimelineTweets(completion: { (result) in
            do {
                guard let tweetResult = result else { return }
        
                guard let tweets = try? JSONDecoder().decode([Tweet].self, from:tweetResult) else {
                    throw BusinessError.parse
                }
                
                completion { tweets }
            } catch let error {
                completion { throw error }
            }
        }, userAccessToken: accessToken, userAccessSecretToken: accessSecretToken)
    }
}
