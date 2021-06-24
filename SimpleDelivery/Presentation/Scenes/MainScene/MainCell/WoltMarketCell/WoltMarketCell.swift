//
//  WoltMarketCell.swift
//  SimpleDelivery
//
//  Created by user200328 on 6/24/21.
//

import UIKit
import Kingfisher

class WoltMarketCell: UICollectionViewCell {

    @IBOutlet weak var backColorView: UIView!
    @IBOutlet weak var restaurantImageView: UIImageView!
    @IBOutlet weak var restaurantNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backColorView.layer.cornerRadius = 10
    }
    
    func configure(with news: News){
        restaurantImageView.kf.setImage(with: URL(string: news.pictureUrl ?? ""))
        restaurantNameLabel.text = news.title ?? ""
    }

}
