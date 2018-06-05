//
//  LoginViewController.swift
//  TweetFeeling
//
//  Created by Samuel Furtado on 29/05/2018.
//  Copyright © 2018 Samuel Furtado. All rights reserved.
//

import UIKit
import TwitterKit

class LoginViewController: UIViewController {
    
    struct Constants {
        static let tweetViewControllerIdentifier = "TweetsViewController"
        static let mainStoryboard = "Main"
    }

    @IBOutlet var loginView: LoginView!
    
    fileprivate func loginTwitter() {
        TWTRTwitter.sharedInstance().logIn { session, error in
            if session != nil {
                let storyBoard = UIStoryboard(name: Constants.mainStoryboard, bundle: nil)
                
                let tweetsViewController = storyBoard.instantiateViewController(withIdentifier: Constants.tweetViewControllerIdentifier) as! TweetsViewController
                
                if let authToken = session?.authToken, let userAccessSecretToken = session?.authTokenSecret {
                    tweetsViewController.setup(with: authToken, userAccessSecretToken: userAccessSecretToken)
                }
                self.navigationController?.pushViewController(tweetsViewController, animated: true)
            } else {
                HandleError.handleBusiness(error: BusinessError.generic)
            }
        }
    }
    
    @IBAction func loginAction(_ sender: Any) {
        loginTwitter()
    }
}
