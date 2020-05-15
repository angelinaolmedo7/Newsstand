//
//  ArticleTableViewCell.swift
//  Newsstand
//
//  Created by Angelina Olmedo on 5/15/20.
//  Copyright © 2020 Angelina Olmedo. All rights reserved.
//

import UIKit
import Kingfisher

class ArticleTableViewCell: UITableViewCell {
    
    static var identifier: String = "ArticleTableViewCell"

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var articleImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setContents(news: NewsStory) {
        titleLabel.text = news.title
        articleImage.kf.setImage(with: news.urlToImage)
        
    }
    
    static var nib: UINib {
           return UINib(nibName: String(describing: self), bundle: nil)
    }
}
