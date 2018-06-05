//
//  LocalizableStringExtension.swift
//  TweetFeeling
//
//  Created by Samuel Furtado on 29/05/2018.
//  Copyright © 2018 Samuel Furtado. All rights reserved.
//

import Foundation

extension String {
    
    /**
     Get localized string without comment
     
     - returns: localized string
     */
    func localize(isAccessibilty: Bool = false) -> String {
        return NSLocalizedString(self,
                                 tableName: "Localizable",
                                 bundle: Bundle.main,
                                 value: "",
                                 comment: "")
    }
}
