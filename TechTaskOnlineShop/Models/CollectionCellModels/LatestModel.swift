//
//  LatestModel.swift
//  TechTaskOnlineShop
//
//  Created by Анатолий Силиверстов on 15.03.2023.
//

import Foundation

struct LatestItems: Codable {
    let latest: [Latest]
}

// MARK: - Latest
struct Latest: Codable {
    let category: String
    let name: String
    let price: Int
    let imageURL: String

    enum CodingKeys: String, CodingKey {
        case category, name, price
        case imageURL = "image_url"
    }
}
