//
//  FlashSaleDetailsViewModel.swift
//  TechTaskOnlineShop
//
//  Created by Анатолий Силиверстов on 19.03.2023.
//

import UIKit

protocol FlashSaleDetailsViewModelType {
    var productDetails: FlashSaleDetailsModel? {get set}
    var sections: [FlashSaleSection] {get set}
    var price: Int? {get set}
    func getData(completion: @escaping (FlashSaleDetailsModel) -> Void)
    func getNumberOfSections() -> Int
    func getNumberOfItemsInSection(section: Int) -> Int
}

final class FlashSaleDetailsViewModel: FlashSaleDetailsViewModelType {
    
    private let networkManager = NetworkManager()
    var productDetails: FlashSaleDetailsModel? = nil
    var colors: [String] = []
    var price: Int? = nil
    var sections: [FlashSaleSection] = []
    
    func getData(completion: @escaping (FlashSaleDetailsModel) -> Void) {
        networkManager.fetchData(from: Constants.flashSaleItemUrl) { result in
            switch result {
                
            case .success(let data):
                guard let productDetails = try? JSONDecoder().decode(FlashSaleDetailsModel.self, from: data) else { return }
                self.getSections(from: productDetails)
                DispatchQueue.main.async {
                    completion(productDetails)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func getSections(from productDetails: FlashSaleDetailsModel) {
        var images: [UIImage] = []
        let urls = productDetails.imageUrls
        for url in urls {
            guard let url = URL(string: url), let data = try? Data(contentsOf: url) else { return }
            if let image = UIImage(data: data) {
                images.append(image)
            }
        }
        self.sections = [FlashSaleSection.largeImages(images),
                         FlashSaleSection.smallImages(images)]
    }
    
    func getNumberOfSections() -> Int {
        self.sections.count
    }
    
    func getNumberOfItemsInSection(section: Int) -> Int {
        self.sections[section].count
    }
}
