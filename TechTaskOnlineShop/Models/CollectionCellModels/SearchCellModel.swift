//
//  SearchCellModel.swift
//  TechTaskOnlineShop
//
//  Created by Анатолий Силиверстов on 16.03.2023.
//

import Foundation

struct SearchCellModel {
    let placeHolder: String
}

extension SearchCellModel {
    static var cellModels: [SearchCellModel] {
        let searchCell = SearchCellModel(placeHolder: "What are you looking for?")
        return [searchCell]
    }
}
