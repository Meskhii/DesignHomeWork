//
//  ViewController.swift
//  SimpleDelivery
//
//  Created by user200328 on 6/24/21.
//

import UIKit

class MainViewController: UIViewController {
    
    private var mainDataSource: MainDataSource!
    private var newsManager: NewsManagerProtocol!
    private var viewModel: MainViewModelProtocol!

    @IBOutlet weak var sliderCollectionView: UICollectionView!
    @IBOutlet weak var mainTableView: UITableView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        sliderCollectionView.registerNib(class: PromotionCell.self)
        mainTableView.registerNib(class: MainCell.self)
        
        configureViewModel()
    }
    
    private func configureViewModel() {
        newsManager = NewsManager()
        viewModel = MainViewModel(with: newsManager)
        mainDataSource = MainDataSource(with: mainTableView, sliderCollectionView: sliderCollectionView, pageControl: pageControl, viewModel: viewModel)
        
        mainDataSource.refresh()
    }
    
}

