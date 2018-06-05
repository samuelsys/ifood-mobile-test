//
//  TweetsViewController.swift
//  TweetFeeling
//
//  Created by Samuel Furtado on 02/06/2018.
//  Copyright © 2018 Samuel Furtado. All rights reserved.
//

import UIKit

class TweetsViewController : UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    struct Constants {
        static let tweetCellReuseIdentifier = "TweetCell"
        static let detailSegueIdentifier = "detailSegueIdentifier"
    }
    
    var userAccessToken : String?
    var userAccessSecretToken: String?
    
    @IBOutlet weak var tweetsTableView: UITableView!
    lazy var manager = HomeManager()
    
    var userTweets = [Tweet](){
        didSet {
            self.tweetsTableView.reloadData()
        }
    }
    
    public func setup( with userAccessToken: String, userAccessSecretToken: String) {
        self.userAccessToken = userAccessToken
        self.userAccessSecretToken = userAccessSecretToken
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tweetsTableView.delegate = self
        tweetsTableView.dataSource = self
        
        if let accessToken = self.userAccessToken , let secretAccessToken = self.userAccessSecretToken {
            loadUserTweets(userAccessToken: accessToken,userAccessSecretToken: secretAccessToken)
        }
    }
    
    fileprivate func loadUserTweets(userAccessToken: String, userAccessSecretToken: String) {
        manager.fetchTimelineTweets(completion: { [weak self] (result) in
            guard let _self = self else { return }
            do {
                guard let tweetResult = try result() else { return }
                _self.userTweets = tweetResult
            } catch {
                HandleError.handleBusiness(error: error as! BusinessError)
            }
            }, accessToken: userAccessToken, accessSecretToken: userAccessSecretToken)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Constants.detailSegueIdentifier, let destination = segue.destination as? SentimentDetailViewController {
            if let row = tweetsTableView.indexPathForSelectedRow?.row {
                if let tweetText = userTweets[row].text {
                    self.analyzeSentiment(completion: { (result) in
                        if let sentiment = result {
                             destination.setup(sentiment:sentiment)
                        }
                    }, text: tweetText)
                }
            }
        }
    }
    
    func analyzeSentiment(completion: @escaping (Sentiment?) -> Void, text: String) {
        manager.analyzeSentiment(completion: { (result) in
            do {
                guard let sentiment = try result() else { return }
                completion(sentiment)
            } catch {
                HandleError.handleBusiness(error: error as! BusinessError)
            }
        }, message: text)
    }

    @IBAction func refreshAction(_ sender: Any) {
        if let accessToken = self.userAccessToken , let secretAccessToken = self.userAccessSecretToken {
            loadUserTweets(userAccessToken: accessToken,userAccessSecretToken: secretAccessToken)
        }
    }
}

// MARK: - UITableViewDelegate && UITableViewDataSource
extension TweetsViewController {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userTweets.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.tweetCellReuseIdentifier, for: indexPath) as! TweetCell
        
        if let tweetText = userTweets[indexPath.row].text {
            cell.setup(message: tweetText)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80.0
    }
}

