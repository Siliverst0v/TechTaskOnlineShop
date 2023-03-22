//
//  Constants.swift
//  TechTaskOnlineShop
//
//  Created by Анатолий Силиверстов on 14.03.2023.
//

import UIKit

enum Constants {
    static let firstNamePlaceholder = "First name"
    static let lastNamePlaceholder = "Last name"
    static let emailPlaceholder = "Email"
    static let signInTitle = "Sign in"
    static let logInTitle = "Log in"
    static let alreadyHaveAccount = "Already have an account?"
    static let signInWithGoogle = "Sign in with Google"
    static let signInWithApple = "Sign in with Apple"
    static let fillInAllTheFields = "Fill in all the fields"
    static let wrongEmailFormat = "Wrong format Email"
    static let userAlreadyRegistered = "User with such data is already registered"
    static let welcomeBackTitle = "Welcome back"
    static let passwordPlaceholder = "Password"
    static let userIsNotRegistered = "User with such data is not registered"
    static let loginTitle = "Login"
    static let enterFirstName = "Enter your first name"
    static let tradeByTitle = "Trade by"
    static let bataTitle = "bata"
    static let latestHeaderTitle = "Latest"
    static let flashSaleHeaderTitle = "Flash sale"
    static let brandsHeaderTitle = "Brands"
    static let resultsCellId = "cellId"
    static let viewAllTitle = "View all"
    static let colorsTitle = "Color:"
    static let inCartTitle = "IN CART"
    static let addToCartTitle = "ADD TO CART"
    static let locationTitle = "Location"
    static let balanceText = "$ 1593"
    static let tradeStore = "Trade store"
    static let paymentMethod = "Payment method"
    static let balance = "Balance"
    static let tradeHistory = "Trade history"
    static let restorePurchase = "Restore Purchase"
    static let help = "Help"
    static let logOut = "Log out"
    static let profileTitle = "Profile"
    static let searchBarPlaceholder = "What are you looking for?"
    static let latestUrl = "https://run.mocky.io/v3/cc0071a1-f06e-48fa-9e90-b1c2a61eaca7"
    static let flashSaleUrl = "https://run.mocky.io/v3/a9ceeb6e-416d-4352-bde6-2203416576ac"
    static let flashSaleItemUrl = "https://run.mocky.io/v3/f7f99d04-4971-45d5-92e0-70333383c239"
    static let searchWordsUrl = "https://run.mocky.io/v3/4c9cd822-9479-4509-803d-63197e5a9e19"
    static let userImageChanged = "UserImageChanged"
    static let changePhotoTitle = "Change photo"
}

enum NumericalConstannts {
    static let defaultCornerRadius: CGFloat = 15
    static let tabBarDefaultCornerRadius: CGFloat = 30
    static let homeCellsCornerRadius: CGFloat = 10
    static let emailTextFieldTag = 3
    static let smallCellWidth: CGFloat = 65
    static let smallSectionSpacing: CGFloat = 10
    static let userCellHeight: CGFloat = 160
    static let uploadCellHeight: CGFloat = 40
    static let profileCellHeight: CGFloat = 65
}

enum ImageConstants {
    //MARK: - Main TabBar
    static let homeTabBarImage = UIImage(named: "Home")
    static let profileTabBarImage = UIImage(named: "Profile")
    static let favouriteTabBarImage = UIImage(named: "Favourite")
    static let cartTabBarImage = UIImage(named: "Cart")
    static let chatTabBarImage = UIImage(named: "Chat")
    
    //MARK: - RegistrationScreen
    static let googleLabelImage = UIImage(named: "Google")
    static let appleLabelImage = UIImage(named: "Apple")
    
    //MARK: - HomeScreen
    static let menuImage = UIImage(named: "Menu")
    static let chevronDownMiniImage = UIImage(named: "ChevronDown")
    static let defaultUserImage = UIImage(systemName: "person.circle")
    static let addProductButtonImage = UIImage(named: "Plus")
    static let addToFavouriteButtonImage = UIImage(named: "Heart")
    
    //MARK: - FlashSaleScreen
    static let ratingStarImage = UIImage(named: "Star")
    static let shareImage = UIImage(named: "Share")
    static let minusImage = UIImage(named: "minus")
    static let miniPlusImage = UIImage(named: "minPlus")
    
    //MARK: - ProfileScreen
    static let uploadButtonImage = UIImage(named: "Upload")
    static let disclousureIndicator = UIImage(named: "DisclosureIndicator")
    
    //MARK: - TextField Extensions
    static let eyeSlashImage = UIImage(systemName: "eye.slash")
    static let eyeImage = UIImage(systemName: "eye")
    static let searchImage = UIImage(named: "Search")
}
