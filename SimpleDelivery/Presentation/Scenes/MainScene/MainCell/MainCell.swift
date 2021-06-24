//
//  MainCell.swift
//  SimpleDelivery
//
//  Created by user200328 on 6/24/21.
//

import UIKit

class MainCell: UITableViewCell {
    
    private var euroDataSource: EuroDataSource!
    private var woltMarketDataSource: WoltMarketDataSource!
    private var newsList = [News]()

    @IBOutlet weak var euroCollectionView: UICollectionView!
    @IBOutlet weak var woltMarketCollectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(with newsList: [News]) {
        self.newsList = newsList
        
        setupEuroDataSource()
        setupWoltDataSource()
        
    }
    
    private func setupEuroDataSource() {
        euroCollectionView.registerNib(class: Euro2020Cell.self)
        euroDataSource = EuroDataSource(with: euroCollectionView, newsList: newsList)
    }
    
    private func setupWoltDataSource() {
        woltMarketCollectionView.registerNib(class: WoltMarketCell.self)
        woltMarketDataSource = WoltMarketDataSource(with: woltMarketCollectionView, newsList: newsList)
    }
}
