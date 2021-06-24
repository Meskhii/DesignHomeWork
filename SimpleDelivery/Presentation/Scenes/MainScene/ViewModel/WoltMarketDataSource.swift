//
//  WoltMarketDataSource.swift
//  SimpleDelivery
//
//  Created by user200328 on 6/24/21.
//

import UIKit

class WoltMarketDataSource: NSObject {
    
    // MARK: - Variables
    private var collectionView: UICollectionView!
    private var newsList = [News]()
    
    // MARK: - Init
    init(with collectionView: UICollectionView, newsList: [News]) {
        super.init()
        
        self.newsList = newsList
        
        self.collectionView = collectionView
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
    }
    
}
// MARK: - UICollectionView Data Source
extension WoltMarketDataSource: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return newsList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.deque(WoltMarketCell.self, for: indexPath)
        cell.configure(with: newsList[indexPath.row])
        return cell
    }
}

extension WoltMarketDataSource: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 120, height: 160)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0)
    }
}
