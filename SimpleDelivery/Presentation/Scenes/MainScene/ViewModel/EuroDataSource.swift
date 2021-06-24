//
//  MainCellDataSource.swift
//  SimpleDelivery
//
//  Created by user200328 on 6/24/21.
//

import UIKit

class EuroDataSource: NSObject {
    
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
extension EuroDataSource: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return newsList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.deque(Euro2020Cell.self, for: indexPath)
        cell.configure(with: newsList[indexPath.row])
        return cell
    }
}

extension EuroDataSource: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 170, height: 170)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0)
    }
}
