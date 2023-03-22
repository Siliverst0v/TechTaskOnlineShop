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
        
        let searchBarWidth = self.frame.width
        let placeholderIconWidth = textFieldInsideSearchBar?.leftView?.frame.width
        let placeHolderWidth = textFieldInsideSearchBar?.attributedPlaceholder?.size().width
        let offsetIconToPlaceholder: CGFloat = 8
        let placeHolderWithIcon = placeholderIconWidth! + offsetIconToPlaceholder
        textFieldInsideSearchBar?.attributedPlaceholder = NSAttributedString(
            string: Constants.searchBarPlaceholder,
            attributes: [NSAttributedString.Key.font: UIFont.montserratRegular12,
                         NSAttributedString.Key.foregroundColor: UIColor.darkGray
                        ]
        )
        
        let offset = UIOffset(horizontal: ((searchBarWidth / 2) - (placeHolderWidth! / 2) - placeHolderWithIcon), vertical: 0)
        self.setPositionAdjustment(offset, for: .search)
    }
}
