//
//  UISearchBar + Extensions.swift
//  TechTaskOnlineShop
//
//  Created by Анатолий Силиверстов on 23.03.2023.
//

import UIKit

extension UISearchBar {
    func setCenteredPlaceHolder(){
        let textFieldInsideSearchBar = self.value(forKey: "searchField") as? UITextField
        textFieldInsideSearchBar?.attributedPlaceholder = NSAttributedString(
            string: Constants.searchBarPlaceholder,
            attributes: [NSAttributedString.Key.font: UIFont.montserratRegular12,
                         NSAttributedString.Key.foregroundColor: UIColor.darkGray,
                        ]
        )
        textFieldInsideSearchBar?.backgroundColor = .searchBarBackground
    }
}
