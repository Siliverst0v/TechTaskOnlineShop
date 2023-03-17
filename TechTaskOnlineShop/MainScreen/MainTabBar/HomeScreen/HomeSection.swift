//
//  HomeSection.swift
//  TechTaskOnlineShop
//
//  Created by Анатолий Силиверстов on 16.03.2023.
//

import Foundation

enum HomeSection {
    case search([SearchCellModel])
    case category([CategoryCellModel])
    case latest([Latest])
    case flashSale([FlashSale])
    case brand([BrandCellModel])
    
    var items: [Any] {
        switch self {
        
        case .search(let items):
            return items
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
        
        case .search(_):
            return ""
        case .category(_):
            return ""
        case .latest(_):
            return "Latest"
        case .flashSale(_):
            return "Flash sale"
        case .brand(_):
            return "Brands"
        }
    }
}
