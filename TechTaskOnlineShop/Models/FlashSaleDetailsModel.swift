//
//  FlashSaleDetailsModel.swift
//  TechTaskOnlineShop
//
//  Created by Анатолий Силиверстов on 19.03.2023.
//

import Foundation

struct FlashSaleDetailsModel: Codable {
    let name, description: String
    let rating: Double
    let numberOfReviews, price: Int
    let colors: [String]
    let imageUrls: [String]

    enum CodingKeys: String, CodingKey {
        case name, description, rating
        case numberOfReviews = "number_of_reviews"
        case price, colors
        case imageUrls = "image_urls"
    }
}
