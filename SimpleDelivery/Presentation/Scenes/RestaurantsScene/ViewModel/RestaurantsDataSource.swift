//
//  RestaurantsDataSource.swift
//  SimpleDelivery
//
//  Created by user200328 on 6/24/21.
//

import UIKit

class RestaurantsDataSource: NSObject {
    
    // MARK: - Variables
    private var tableView: UITableView!
    private var viewModel: RestaurantsViewModelProtocol!
    private var navController: UINavigationController!
    
    private var newsList = [News]()
    
    // MARK: - Init
    init(with tableView: UITableView, viewModel: RestaurantsViewModelProtocol, navController: UINavigationController) {
        super.init()
        
        self.tableView = tableView
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        self.viewModel = viewModel
        
        self.navController = navController
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
    
    private func navigateToRestaurantInfo() {
        let sb = UIStoryboard(name: "RestaurantInfoViewController", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "RestaurantInfoViewController")
        
        navController.pushViewController(vc, animated: true)
    }
        
}

// MARK: - UITableView Data Source
extension RestaurantsDataSource: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.deque(RestaurantsCell.self, for: indexPath)
        if !newsList.isEmpty {
            cell.configure(with: newsList[indexPath.row])
        }
        return cell
    }
    
}

extension RestaurantsDataSource: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 290
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        navigateToRestaurantInfo()
    }
}
