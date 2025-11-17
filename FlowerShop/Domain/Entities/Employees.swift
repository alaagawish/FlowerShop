//
//  Employees.swift
//  FlowerShop
//
//  Created by Alaa Gawish on 17/11/2025.
//

import Foundation

struct Employees: Codable {
    
    let name: String?
    let phone: String?
    let salary: Int?
    
    private enum CodingKeys: String, CodingKey {
        case name = "name"
        case phone = "phone"
        case salary = "salary"
    }
    
}
