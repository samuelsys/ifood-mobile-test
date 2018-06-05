//
//  SentimentDetailView.swift
//  TweetFeeling
//
//  Created by Samuel Furtado on 03/06/2018.
//  Copyright © 2018 Samuel Furtado. All rights reserved.
//

import UIKit

class SentimentDetailView: UIView {
    
    enum Emoticons : String {
        case happy = "😃"
        case neutral = "😐"
        case sad = "😔"
    }

    @IBOutlet weak var emoticonLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    
    // setup sentiment detail cell
    //
    // Params:
    // sentiment: Model with sentiment status
    
    func setup(sentiment: Sentiment) {
        if let status = sentiment.status {
            configureViewColor(status: status)
        }
    }
    
    func configureViewColor(status: Status) {
        switch status {
            case .happy:
                self.backgroundColor = UIColor.yellow
                emoticonLabel.text = Emoticons.happy.rawValue
                messageLabel.text =  LocalizableStringConstants.happy.localize()
            case .neutral:
                self.backgroundColor = UIColor.gray
                emoticonLabel.text = Emoticons.neutral.rawValue
                messageLabel.text =  LocalizableStringConstants.neutral.localize()
            case .sad:
                self.backgroundColor = UIColor.blue
                emoticonLabel.text = Emoticons.sad.rawValue
                messageLabel.text = LocalizableStringConstants.sad.localize()
        }
    }
}
