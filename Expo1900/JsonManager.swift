//
//  JsonManager.swift
//  Expo1900
//
//  Created by 우롱차, marisol on 2022/04/12.
//

import UIKit

protocol JsonManagerable {
    func decodedResult() throws -> [Item]
    func decodedResult() throws -> ExpositionInfo
}

struct JsonManager: JsonManagerable {
    func decodedResult() throws -> [Item] {
        let jsonDecoder = JSONDecoder()
         
        guard let itemData = NSDataAsset(name: DataFileName.items) else {
            throw ExpoError.noFileError
        }
        
        guard let items = try? jsonDecoder.decode([Item].self, from: itemData.data) else {
            throw ExpoError.decodingError
        }
        
        return items
    }
    
    func decodedResult() throws -> ExpositionInfo {
        let jsonDecoder = JSONDecoder()
        
        guard let expositionInfoData = NSDataAsset(name: DataFileName.expositionInfo) else {
            throw ExpoError.noFileError
        }
  
        guard let expositionInfo = try? jsonDecoder.decode(ExpositionInfo.self, from: expositionInfoData.data) else {
            throw ExpoError.decodingError
        }
        
        return expositionInfo
    }
}
