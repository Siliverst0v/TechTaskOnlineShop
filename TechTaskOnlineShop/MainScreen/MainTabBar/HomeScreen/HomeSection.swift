//
//  HomeSection.swift
//  TechTaskOnlineShop
//
//  Created by Анатолий Силиверстов on 16.03.2023.
//

import Foundation

enum HomeSection {
    case category([CategoryCellModel])
    case latest([Latest])
    case flashSale([FlashSale])
    case brand([BrandCellModel])
    
    var items: [Any] {
        switch self {
            
        case .category(let items):
            return items
        case .latest(let items):
            return items
        case .flashSale(let items):
            return items
        case .brand(let items):
            return items
        }
    }
    
    var count: Int {
        items.count
    }
    
    var title: String {
        switch self {
            
        case .category(_):
            return ""
        case .latest(_):
            return Constants.latestHeaderTitle
        case .flashSale(_):
            return Constants.flashSaleHeaderTitle
        case .brand(_):
            return Constants.brandsHeaderTitle
        }
    }
}
