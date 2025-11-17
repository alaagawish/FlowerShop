//
//  FlowerShopData.swift
//  FlowerShop
//
//  Created by Alaa Gawish on 17/11/2025.
//

import Foundation

struct FlowerShopData: Codable {
    
    let flowers: [Flowers]?
    let employees: [Employees]?
    let clients: [Clients]?
    
    private enum CodingKeys: String, CodingKey {
        case flowers = "flowers"
        case employees = "employees"
        case clients = "clients"
    }
    
}
