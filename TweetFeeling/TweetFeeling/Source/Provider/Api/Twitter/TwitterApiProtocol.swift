//
//  TwitterApiProtocol.swift
//  TweetFeeling
//
//  Created by Samuel Furtado on 29/05/2018.
//  Copyright © 2018 Samuel Furtado. All rights reserved.
//

import Foundation

typealias TwitterCallback = (Data?) -> Void

protocol TwitterApiProtocol {
    
    //
    // Call a list of an user tweets
    //
    // Params
    //  accessToken: user access token
    //  accessSecretToken: user access Secret Token
    //
    
    func fetchTimelineTweets(completion: @escaping TwitterCallback, userAccessToken: String, userAccessSecretToken: String)
    
}

