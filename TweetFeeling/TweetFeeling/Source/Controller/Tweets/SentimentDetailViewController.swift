//
//  SentimentDetailViewController.swift
//  TweetFeeling
//
//  Created by Samuel Furtado on 03/06/2018.
//  Copyright © 2018 Samuel Furtado. All rights reserved.
//

import UIKit

class SentimentDetailViewController: UIViewController {

    @IBOutlet weak var detailView: SentimentDetailView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.black.withAlphaComponent(0.8)
    }
    
    func setup(sentiment: Sentiment){
        detailView.setup(sentiment: sentiment)
    }
    
    @IBAction func closeModal(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
