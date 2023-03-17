//
//  ProfileCellModel.swift
//  TechTaskOnlineShop
//
//  Created by Анатолий Силиверстов on 14.03.2023.
//

import Foundation

enum accessoryViewType {
    case indicator
    case balance
    case none
}

struct ProfileCellModel {
    let image: String
    let title: String
    let accessoryView: accessoryViewType
}

extension ProfileCellModel {
    static var cells: [ProfileCellModel] {
        let tradeStoreCell = ProfileCellModel(
            image: "Card",
            title: Constants.tradeStore,
            accessoryView: .indicator)
        let paymentMethodCell = ProfileCellModel(
            image: "Card",
            title: Constants.paymentMethod,
            accessoryView: .indicator
        )
        let balanceCell = ProfileCellModel(
            image: "Card",
            title: Constants.balance,
            accessoryView: .balance
        )
        let tradeHistoryCell = ProfileCellModel(
            image: "Card",
            title: Constants.tradeHistory,
            accessoryView: .indicator
        )
        let restorePurchaseCell = ProfileCellModel(
            image: "Restore",
            title: Constants.restorePurchase,
            accessoryView: .indicator
        )
        let helpCell = ProfileCellModel(
            image: "Help",
            title: Constants.help,
            accessoryView: .none
        )
        let logOutCell = ProfileCellModel(
            image: "LogOut",
            title: Constants.logOut,
            accessoryView: .none
        )
        return [tradeStoreCell,
                paymentMethodCell,
                balanceCell,
                tradeHistoryCell,
                restorePurchaseCell,
                helpCell,
                logOutCell
        ]
    }
}
