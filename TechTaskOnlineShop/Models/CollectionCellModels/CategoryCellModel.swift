//
//  CategoryCellModel.swift
//  TechTaskOnlineShop
//
//  Created by Анатолий Силиверстов on 15.03.2023.
//

import Foundation

struct CategoryCellModel {
    let image: String
    let title: String
}

extension CategoryCellModel {
    static var cellModels: [CategoryCellModel] {
        let phonesCell = CategoryCellModel(
            image: "Phone",
            title: "Phone"
        )
        let headphonesCell = CategoryCellModel(
            image: "Headphones",
            title: "Headphones"
        )
        let gamesCell = CategoryCellModel(
            image: "Games",
            title: "Games"
        )
        let carsCell = CategoryCellModel(
            image: "Cars",
            title: "Cars"
        )
        let furnitureCell = CategoryCellModel(
            image: "Furniture",
            title: "Furniture"
        )
        let kidsCell = CategoryCellModel(
            image: "Kids",
            title: "Kids"
        )
        
        return [
            phonesCell,
            headphonesCell,
            gamesCell,
            carsCell,
            furnitureCell,
            kidsCell
        ]
    }
}
