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
}

final class HomeViewModel: HomeViewModelType {
    let netWorkManager = NetworkManager()
    
    let urls = [Constants.latestUrl, Constants.latestUrl]
    var sections: [HomeSection] = []
    var searchModels: [SearchCellModel] = []
    var categoryModels: [CategoryCellModel] = []
    var latestModels: [Latest] = []
    var flashSaleModels: [FlashSale] = []
    var brandCellModels: [BrandCellModel] = []
    
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
            self.searchModels = SearchCellModel.cellModels
            self.categoryModels = CategoryCellModel.cellModels
            self.brandCellModels = BrandCellModel.cellModels
            self.sections = [HomeSection.search(self.searchModels),
                             HomeSection.category(self.categoryModels),
                             HomeSection.latest(self.latestModels),
                             HomeSection.flashSale(self.flashSaleModels),
                             HomeSection.brand(self.brandCellModels)]
            completion()
        }
    }
    
    func getUserImage() -> UIImage? {
        let defaultImage = UIImage(systemName: "person.circle")
        guard let encodedUser = UserDefaultsManager.currentUser else {return defaultImage}
        guard let user = try? JSONDecoder().decode(User.self, from: encodedUser)
        else {
            return defaultImage
        }
        return DataManager.shared.getImage(from: user.firstName)
    }
}
