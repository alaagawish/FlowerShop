//
//  ShopRepo.swift
//  FlowerShop
//
//  Created by Alaa Gawish on 18/11/2025.
//

import Foundation

protocol ShopRepo {
    func fetchEmployees(completion: @escaping ([Employees]) -> Void)
    func fetchFlowers(completion: @escaping ([Flowers]) -> Void)
    func fetchClients(completion: @escaping ([Clients]) -> Void) 
}
