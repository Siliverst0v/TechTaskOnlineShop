//
//  BrandCellModel.swift
//  TechTaskOnlineShop
//
//  Created by Анатолий Силиверстов on 15.03.2023.
//

import Foundation

struct BrandCellModel {
    let image: String
}

extension BrandCellModel {
    static var cellModels: [BrandCellModel] {
        let pumaCell = BrandCellModel(image: "PUMA")
        let adidasCell = BrandCellModel(image: "ADIDAS")
        let nikeCell = BrandCellModel(image: "Nike")
        let reebokcell = BrandCellModel(image: "Reebok")
        
        return [pumaCell, adidasCell, nikeCell, reebokcell]
    }
}
