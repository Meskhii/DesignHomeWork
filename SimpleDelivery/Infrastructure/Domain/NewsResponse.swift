//
//  NewsResponse.swift
//  SimpleDelivery
//
//  Created by user200328 on 6/24/21.
//

import Foundation

struct NewsResponse: Codable {
    
    let newsList: [News]
    
    enum CodingKeys: String, CodingKey {
        case newsList = "List"
    }
}
