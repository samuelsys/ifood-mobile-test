//
//  TweetCell.swift
//  TweetFeeling
//
//  Created by Samuel Furtado on 02/06/2018.
//  Copyright © 2018 Samuel Furtado. All rights reserved.
//

import UIKit

class TweetCell : UITableViewCell {
    
    @IBOutlet weak var tweetText: UILabel!
    
    // setup sentiment detail cell
    //
    // Params:
    // message: tweet text to set on cell
    
    func setup(message: String) {
        tweetText.text = message
    }
    
    override func prepareForReuse() {
        tweetText.text = ""
    }
}
