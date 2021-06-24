//
//  RestaurantInfoViewController.swift
//  SimpleDelivery
//
//  Created by user200328 on 6/24/21.
//

import UIKit

class RestaurantInfoViewController: UIViewController {


    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var moreButton: UIButton!
    @IBOutlet weak var deliveryPriceLabel: UILabel!
    @IBOutlet weak var minOrderLabel: UILabel!
    @IBOutlet weak var moreInfoButton: UIButton!
    @IBOutlet weak var changeButton: UIButton!
    @IBOutlet weak var startNowButton: UIButton!
    @IBOutlet weak var languageView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupCornerRadiuses()
        
        self.navigationController?.navigationBar.isHidden = true
    }
    

    private func setupCornerRadiuses() {
        deliveryPriceLabel.layer.masksToBounds = true
        deliveryPriceLabel.layer.cornerRadius = 15
        minOrderLabel.layer.masksToBounds = true
        minOrderLabel.layer.cornerRadius = 15
        
        backButton.layer.cornerRadius = 20
        moreButton.layer.cornerRadius = 20
        
        moreInfoButton.layer.cornerRadius = 10
        changeButton.layer.cornerRadius = 10
        startNowButton.layer.cornerRadius = 10
        
        languageView.layer.cornerRadius = 10
    }

    @IBAction func navigateBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
