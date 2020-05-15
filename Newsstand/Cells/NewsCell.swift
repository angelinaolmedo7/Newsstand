//
//  NewsCell.swift
//  Newsstand
//
//  Created by Angelina Olmedo on 5/12/20.
//  Copyright © 2020 Angelina Olmedo. All rights reserved.
//

import UIKit

class NewsCell: UICollectionViewCell {
    
    static var identifier: String = "NewsCell"

    static var nib: UINib {
        return UINib(nibName: String(describing: self), bundle: nil)
    }

    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setContents(title: String!) {
        titleLabel.text = title.capitalized
    }
}
