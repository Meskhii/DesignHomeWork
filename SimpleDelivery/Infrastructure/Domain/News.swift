//
//  News.swift
//  SimpleDelivery
//
//  Created by user200328 on 6/24/21.
//

import Foundation

struct News: Codable {
    let title: String?
    let content: String?
    let pictureUrl: String?
    
    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case content = "Content"
        case pictureUrl = "MediumCoverPhotoUrl"
    }
}
