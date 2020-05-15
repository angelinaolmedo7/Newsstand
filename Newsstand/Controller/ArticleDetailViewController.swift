//
//  ArticleDetailViewController.swift
//  Newsstand
//
//  Created by Angelina Olmedo on 5/15/20.
//  Copyright © 2020 Angelina Olmedo. All rights reserved.
//

import UIKit
import Kingfisher
import WebKit

class ArticleDetailViewController: UIViewController {
    
    var myStory : NewsStory!

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!
    @IBOutlet weak var webEmbed: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpDetails(article: myStory)
    }
    
    func setUpDetails(article: NewsStory) {
        titleLabel.text = article.title!
        authorLabel.text = article.author
        bodyLabel.text = article.description
        image.kf.setImage(with: article.urlToImage)
        webEmbed.load(URLRequest(url: article.url!))
    }


}
