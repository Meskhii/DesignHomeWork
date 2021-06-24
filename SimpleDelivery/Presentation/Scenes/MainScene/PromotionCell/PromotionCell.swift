//
//  PromotionCell.swift
//  SimpleDelivery
//
//  Created by user200328 on 6/24/21.
//

import UIKit

class PromotionCell: UICollectionViewCell {

    @IBOutlet weak var sliderImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        sliderImageView.layer.cornerRadius = 10
    }

    func configure(with image: UIImage) {
        sliderImageView.image = image

    }
}
