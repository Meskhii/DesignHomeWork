//
//  MainViewModel.swift
//  SimpleDelivery
//
//  Created by user200328 on 6/24/21.
//

import Foundation

protocol MainViewModelProtocol: AnyObject {
    func fetchNewsList(completion: @escaping((Result<[News], Error>) -> Void))
    
    init(with newsManager: NewsManagerProtocol)
}

final class MainViewModel: MainViewModelProtocol {
    
    private let newsManager: NewsManagerProtocol
    
    init(with newsManager: NewsManagerProtocol) {
        self.newsManager = newsManager
    }
    
    func fetchNewsList(completion: @escaping((Result<[News], Error>) -> Void)) {
        newsManager.fetchNewsList(completion: completion)
    }
    
}
