//
//  HandleError.swift
//  TweetFeeling
//
//  Created by Samuel Furtado on 04/06/2018.
//  Copyright © 2018 Samuel Furtado. All rights reserved.
//

import UIKit
import SwiftMessages

/**
 *  Structure responsible to handle and show error to user, both business and technical errors
 */
struct HandleError {
    // MARK: - Constants
    
    /**
     Handle all types of BusinessError
     
     - parameter error:                BusinessError object
     */
    static func handleBusiness(error: BusinessError) {
        let errorTitle = LocalizableStringConstants.BusinessError.localize()
        
        switch error {
        case .offlineMode:
            let messageError = LocalizableStringConstants.offlineMode.localize()
            showStatusLine(title: errorTitle, description: messageError)
            
        case .generic:
            let messageError = LocalizableStringConstants.genericError.localize()
            showStatusLine(title: errorTitle, description: messageError)
        case .parse:
        let messageError = LocalizableStringConstants.parseError.localize()
        showStatusLine(title: errorTitle, description: messageError)
        }
    }
    
    static func showStatusLine(title: String, description: String) {
        // View setup
        let view = MessageView.viewFromNib(layout: .statusLine)
        
        view.configureContent(title: title, body: description, iconImage: nil, iconText: nil, buttonImage: nil, buttonTitle: "Hide", buttonTapHandler: { _ in SwiftMessages.hide() })
        view.configureTheme(.info, iconStyle: .light)
        
        // Config setup
        var config = SwiftMessages.Config()
        
        config.presentationContext = .window(windowLevel: UIWindowLevelStatusBar)
        config.duration = .seconds(seconds: 5)
        config.dimMode = .gray(interactive: false)
        config.preferredStatusBarStyle = .lightContent
        
        // Show
        SwiftMessages.show(config: config, view: view)
    }
}
