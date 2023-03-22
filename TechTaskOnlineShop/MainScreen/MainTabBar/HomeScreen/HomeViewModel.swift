//
//  HomeViewModel.swift
//  TechTaskOnlineShop
//
//  Created by Анатолий Силиверстов on 14.03.2023.
//

import UIKit

protocol HomeViewModelType {
    var sections: [HomeSection] { get set }
    func getData(completion: @escaping () -> Void)
    func getNumberOfSections() -> Int
    func getNumberOfItemsInSection(section: Int) -> Int
    func getUserImage() -> UIImage?
    func getSearchWords(searchText: String, completion: @escaping ([String]) -> Void)
}

final class HomeViewModel: HomeViewModelType {
    let netWorkManager = NetworkManager()
    
    var sections: [HomeSection] = []
    
    private var categoryModels: [CategoryCellModel] = []
    private var latestModels: [Latest] = []
    private var flashSaleModels: [FlashSale] = []
    private var brandCellModels: [BrandCellModel] = []
    
    func getNumberOfSections() -> Int {
        self.sections.count
    }
    
    func getNumberOfItemsInSection(section: Int) -> Int {
        self.sections[section].count
    }
    
    func getData(completion: @escaping () -> Void) {
        let group = DispatchGroup()
        group.enter()
        netWorkManager.fetchData(from: Constants.latestUrl) { [weak self] result in
            switch result {
                
            case .success(let data):
                guard let latestData = try? JSONDecoder().decode(LatestItems.self, from: data) else { return }
                self?.latestModels = latestData.latest
                group.leave()
            case .failure(let error):
                print(error)
            }
        }
        
        group.enter()
        netWorkManager.fetchData(from: Constants.flashSaleUrl) { [weak self] result in
            switch result {
                
            case .success(let data):
                guard let flashSaleData = try? JSONDecoder().decode(FlashSaleItems.self, from: data) else { return }
                self?.flashSaleModels = flashSaleData.flashSale
                group.leave()
            case .failure(let error):
                print(error)
            }
        }
        group.notify(queue: .main) {
            self.categoryModels = CategoryCellModel.cellModels
            self.brandCellModels = BrandCellModel.cellModels
            self.sections = [HomeSection.category(self.categoryModels),
                             HomeSection.latest(self.latestModels),
                             HomeSection.flashSale(self.flashSaleModels),
                             HomeSection.brand(self.brandCellModels)]
            completion()
        }
    }
    
    func getUserImage() -> UIImage? {
        let defaultImage = ImageConstants.defaultUserImage
        guard let encodedUser = UserDefaultsManager.currentUser else {return defaultImage}
        guard let user = try? JSONDecoder().decode(User.self, from: encodedUser)
        else {
            return defaultImage
        }
        return ImageManager.shared.getImage(from: user.firstName) ?? defaultImage
    }
    
    func getSearchWords(searchText: String, completion: @escaping ([String]) -> Void) {
        var similarWords: [String] = []
        netWorkManager.fetchData(from: Constants.searchWordsUrl) { result in
            switch result {
                
            case .success(let data):
                guard let searchWords = try? JSONDecoder().decode(SearchWords.self, from: data) else { return }
                for word in searchWords.words {
                    if word.localizedCaseInsensitiveContains(searchText) {
                        similarWords.append(word)
                    }
                }
                completion(similarWords)
            case .failure(let error):
                print(error)
            }
        }
    }
}
