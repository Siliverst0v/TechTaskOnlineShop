//
//  FileManager.swift
//  TechTaskOnlineShop
//
//  Created by Анатолий Силиверстов on 19.03.2023.
//

import UIKit

final class DataManager {
    
    static let shared = DataManager()
    
    func saveImage(image: UIImage, for key: String) {
        let picturesUrl = FileManager.default.urls(for: .picturesDirectory, in: .userDomainMask)[0]
        let url = picturesUrl.appendingPathExtension(key)
        if let data = image.pngData() {
            do {
                try data.write(to: url)
            } catch {
                print("Unable to Write Image Data to Disk")
            }
        }
    }
    
    func getImage(from key: String) -> UIImage? {
        let picturesUrl = FileManager.default.urls(for: .picturesDirectory, in: .userDomainMask)[0]
        guard let data = try? Data(contentsOf: picturesUrl.appendingPathExtension(key)) else {return nil}
        return UIImage(data: data)
    }
}
