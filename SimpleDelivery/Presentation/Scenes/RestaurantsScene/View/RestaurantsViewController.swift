//
//  RestaurantsViewController.swift
//  SimpleDelivery
//
//  Created by user200328 on 6/24/21.
//

import UIKit

class RestaurantsViewController: UIViewController {
    
    private var restaurantsDataSource: RestaurantsDataSource!
    private var newsManager: NewsManagerProtocol!
    private var viewModel: RestaurantsViewModelProtocol!

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.registerNib(class: RestaurantsCell.self)
        configureViewModel()
        
    }
    
    private func configureViewModel() {
        newsManager = NewsManager()
        viewModel = RestaurantsViewModel(with: newsManager)
        restaurantsDataSource = RestaurantsDataSource(with: tableView,viewModel: viewModel, navController: self.navigationController!)
        
        restaurantsDataSource.refresh()
    }

}
