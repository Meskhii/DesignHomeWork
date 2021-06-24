//
//  MainDataSource.swift
//  SimpleDelivery
//
//  Created by user200328 on 6/24/21.
//

import UIKit

class MainDataSource: NSObject {
    
    // MARK: - Variables
    private var tableView: UITableView!
    private var collectionView: UICollectionView!
    private var pageControl: UIPageControl!
    private var newsList = [News]()
    private var sliderImages = [UIImage(named: "1"), UIImage(named: "2"),
                                UIImage(named: "3"), UIImage(named: "4"),
                                UIImage(named: "5"), UIImage(named: "6"),
                                UIImage(named: "7"), UIImage(named: "8")]
    private var timer: Timer?
    private var currentCellIndex = 0
    
    private var viewModel: MainViewModelProtocol!
    
    // MARK: - Init
    init(with tableView: UITableView, sliderCollectionView: UICollectionView, pageControl: UIPageControl, viewModel: MainViewModelProtocol) {
        super.init()
        
        self.tableView = tableView
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        self.collectionView = sliderCollectionView
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        
        self.pageControl = pageControl
        pageControl.numberOfPages = sliderImages.count
        
        self.viewModel = viewModel
        
        startTimer()
    }
    
    func refresh() {
        viewModel.fetchNewsList { [weak self] result in
            switch result {
            case .success(let newsList):
                self?.newsList = newsList
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
            case .failure(let err):
                print(err)
            }
        }
    }
    
    private func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1.5, target: self, selector: #selector(showNextImage), userInfo: nil, repeats: true)
    }
    
    @objc private func showNextImage() {
        currentCellIndex += 1
        collectionView.scrollToItem(at: IndexPath(item: currentCellIndex, section: 0), at: .centeredHorizontally, animated: true)
        pageControl.currentPage = currentCellIndex
        if currentCellIndex == sliderImages.count - 1 {
            currentCellIndex = 0
        }
    }
    
}

// MARK: - UITableView Data Source
extension MainDataSource: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.deque(MainCell.self, for: indexPath)
        if !newsList.isEmpty {
            cell.configure(with: newsList)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 460
    }
}

// MARK: - UICollectionView Data Source
extension MainDataSource: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sliderImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.deque(PromotionCell.self, for: indexPath)
        cell.configure(with: sliderImages[indexPath.row]!)
        return cell
    }
}

// MARK: - UICollectionView Delegate Flow Layout
extension MainDataSource: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height - 20)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
}
