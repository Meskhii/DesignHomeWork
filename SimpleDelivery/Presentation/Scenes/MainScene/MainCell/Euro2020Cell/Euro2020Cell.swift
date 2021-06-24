//
//  Euro2020Cell.swift
//  SimpleDelivery
//
//  Created by user200328 on 6/24/21.
//

import UIKit
import Kingfisher

class Euro2020Cell: UICollectionViewCell {

    @IBOutlet weak var backColorView: UIView!
    @IBOutlet weak var euroImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        backColorView.layer.cornerRadius = 10
        
    }
    
    func configure(with news: News) {
        euroImageView.kf.setImage(with: URL(string: news.pictureUrl ?? ""))
        titleLabel.text = news.title ?? ""
        contentLabel.text = news.content ?? ""
    }

}
