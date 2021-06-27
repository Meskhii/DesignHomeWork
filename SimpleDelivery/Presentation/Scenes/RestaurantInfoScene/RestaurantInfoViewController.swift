//
//  RestaurantInfoViewController.swift
//  SimpleDelivery
//
//  Created by user200328 on 6/24/21.
//

import UIKit

class RestaurantInfoViewController: UIViewController {

    @IBOutlet weak var detailImageBlurView: UIView!
    
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var moreButton: UIButton!
    @IBOutlet weak var deliveryPriceLabel: UILabel!
    @IBOutlet weak var minOrderLabel: UILabel!
    @IBOutlet weak var moreInfoButton: UIButton!
    @IBOutlet weak var changeButton: UIButton!
    @IBOutlet weak var startNowButton: UIButton!
    @IBOutlet weak var languageView: UIView!
    
    @IBOutlet weak var scrollView: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureStatusBar()
        
        self.scrollView.delegate = self
        
        setupCornerRadiuses()
        
        self.navigationController?.navigationBar.isHidden = true
    }
    
    
    private func configureStatusBar() {
        if #available(iOS 13.0, *) {
            let app = UIApplication.shared
            let statusBarHeight: CGFloat = app.statusBarFrame.size.height
            
            let statusbarView = UIView()
            statusbarView.backgroundColor = UIColor.red
            statusbarView.layer.cornerRadius = 12
            view.addSubview(statusbarView)
          
            statusbarView.translatesAutoresizingMaskIntoConstraints = false
            statusbarView.heightAnchor
                .constraint(equalToConstant: statusBarHeight/2).isActive = true
            statusbarView.widthAnchor
                .constraint(equalToConstant: 64).isActive = true
            statusbarView.topAnchor
                .constraint(equalTo: view.topAnchor,constant: 13).isActive = true
            
            statusbarView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
            
          
        }
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

extension RestaurantInfoViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        scrollView.contentOffset.x = 0
        
        detailImageBlurView.alpha = scrollView.contentOffset.y/240
        if scrollView.contentOffset.y < 150 {
            self.deliveryPriceLabel.isHidden = false
            self.minOrderLabel.isHidden = false
        } else {
            self.deliveryPriceLabel.isHidden = true
            self.minOrderLabel.isHidden = true
        }
    }
}
