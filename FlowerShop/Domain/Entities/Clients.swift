//
//  Clients.swift
//  FlowerShop
//
//  Created by Alaa Gawish on 17/11/2025.
//

import Foundation

struct Clients: Codable {
    
    let name: String?
    var address: String?
    var phone: String?
    
    private enum CodingKeys: String, CodingKey {
        case name = "name"
        case address = "address"
        case phone = "phone"
    }
    
}
