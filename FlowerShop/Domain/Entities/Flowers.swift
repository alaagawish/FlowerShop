//
//  Flowers.swift
//  FlowerShop
//
//  Created by Alaa Gawish on 17/11/2025.
//

import Foundation

struct Flowers: Codable {
    
    let name: String?
    var stock: Int?
    let price: Double?
    let imageUrl: String?
    
    private enum CodingKeys: String, CodingKey {
        case name = "name"
        case stock = "stock"
        case price = "price"
        case imageUrl = "image_url"
    }
    
}
