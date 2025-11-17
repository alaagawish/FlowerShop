//
//  ShopResponse.swift
//  FlowerShop
//
//  Created by Alaa Gawish on 17/11/2025.
//

import Foundation

struct ShopResponse: Codable {
    
    let flowerShopData: FlowerShopData?
    
    private enum CodingKeys: String, CodingKey {
        case flowerShopData = "flower_shop_data"
    }
    
    func flowersToDomain() -> [Flowers] {
        return flowerShopData?.flowers ?? []
    }
    func clientsToDomain() -> [Clients] {
        return flowerShopData?.clients ?? []
    }
    func employeesToDomain() -> [Employees] {
        return flowerShopData?.employees ?? []
    }
    
}
