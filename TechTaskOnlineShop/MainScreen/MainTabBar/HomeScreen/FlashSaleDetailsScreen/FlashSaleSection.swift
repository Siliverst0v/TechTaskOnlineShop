//
//  FlashSaleSection.swift
//  TechTaskOnlineShop
//
//  Created by Анатолий Силиверстов on 20.03.2023.
//

import UIKit

enum FlashSaleSection {
    case largeImages([UIImage])
    case smallImages([UIImage])
    
    var items: [Any] {
        switch self {
        
        case .largeImages(let items):
            return items
        case .smallImages(let items):
            return items
        }
    }
    
    var count: Int {
        items.count
    }
}
