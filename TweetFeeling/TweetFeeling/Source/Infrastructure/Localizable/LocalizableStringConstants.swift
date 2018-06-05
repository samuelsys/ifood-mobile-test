//
//  LocalizableStringConstants.swift
//  TweetFeeling
//
//  Created by Samuel Furtado on 04/06/2018.
//  Copyright © 2018 Samuel Furtado. All rights reserved.
//

enum LocalizableStringConstants: String {
    
    // Strings
    case happy
    case neutral
    case sad
    
    // Error Handling
    case BusinessError = "businessError"
    case offlineMode
    case genericError
    case parseError
    
    /// This method localizes the raw value of the object
    ///
    /// - Returns: Return the localized string for that key
    func localize() -> String {
        return self.rawValue.localize()
    }
}
