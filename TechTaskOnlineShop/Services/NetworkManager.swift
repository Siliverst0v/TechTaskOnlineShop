//
//  NetworkManager.swift
//  TechTaskOnlineShop
//
//  Created by Анатолий Силиверстов on 15.03.2023.
//

import Foundation

final class NetworkManager {
    
    func fetchData(from url: String, handler: @escaping (Result<Data, Error>) -> Void) {
        guard let url = URL(string: url) else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                handler(.success(data))
            }
            
            if let error = error {
                handler(.failure(error))
            }
        }.resume()
    }
}
