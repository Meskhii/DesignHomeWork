//
//  RestaurantsCell.swift
//  SimpleDelivery
//
//  Created by user200328 on 6/24/21.
//

import UIKit
import Kingfisher

class RestaurantsCell: UITableViewCell {
    
    @IBOutlet weak var timeView: UIView!
    @IBOutlet weak var mainView: UIView!
    
    @IBOutlet weak var restaurantImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        timeView.layer.cornerRadius = 5
        mainView.layer.cornerRadius = 20
        restaurantImage.layer.masksToBounds = true

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(with news: News) {
        restaurantImage.kf.setImage(with: URL(string: news.pictureUrl ?? ""))
        titleLabel.text = news.title ?? ""
        contentLabel.text = news.content ?? ""
    }
    
}
